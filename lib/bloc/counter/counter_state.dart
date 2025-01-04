sealed class CounterState {}

class CounterInitial extends CounterState {
  int initialValue;
  CounterInitial(this.initialValue);
}

class CounterIncrement extends CounterState {}

class CounterDecrement extends CounterState {}
