import 'package:flutter09/bloc/counter/counter_event.dart';
import 'package:flutter09/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int initialState) : super(CounterInitial(0)) {
    on<IncrementCounter>((event, emit) => emit(state));
    // on<DecrementCounter>((event, emit) => emit(state + 1));
  }
}
