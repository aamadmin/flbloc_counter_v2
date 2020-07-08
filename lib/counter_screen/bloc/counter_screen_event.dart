part of 'counter_screen_bloc.dart';

@immutable
abstract class CounterScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementCounterValue extends CounterScreenEvent {}

class DecrementCounterValue extends CounterScreenEvent {}

class GenerateRandomCounterValue extends CounterScreenEvent {}

class ResetCounterValue extends CounterScreenEvent {}
