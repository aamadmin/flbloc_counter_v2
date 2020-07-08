import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flbloc_counter_v2/repository/counter_repository.dart';
import 'package:meta/meta.dart';

part 'counter_screen_event.dart';
part 'counter_screen_state.dart';

class CounterScreenBloc extends Bloc<CounterScreenEvent, CounterScreenState> {
  CounterScreenBloc() : super(ShowCounterValue(0));
  int counterValue = 0;
  @override
  Stream<CounterScreenState> mapEventToState(
    CounterScreenEvent event,
  ) async* {
    if (event is IncrementCounterValue) {
      this.counterValue++;
      yield ShowCounterValue(counterValue);
    }
    if (event is DecrementCounterValue) {
      this.counterValue--;
      yield ShowCounterValue(counterValue);
    }
    if (event is GenerateRandomCounterValue) {
      yield ShowLoadingCounterScreen();
      counterValue = await CounterRepository().getRandomValue();
      yield ShowCounterValue(counterValue);
    }
    if (event is ResetCounterValue) {
      counterValue = 0;
      yield ShowCounterValue(counterValue);
    }
  }
}
