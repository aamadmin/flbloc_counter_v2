part of 'counter_screen_bloc.dart';

@immutable
abstract class CounterScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowLoadingCounterScreen extends CounterScreenState {}

class ShowCounterValue extends CounterScreenState {
  final int counterValue;
  ShowCounterValue(this.counterValue);
  @override
  List<Object> get props => [counterValue];
}
