import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
abstract class MyEvent {}

class UpdateValuesEvent extends MyEvent {
  final int i;
  final int j;
  final int k;

  UpdateValuesEvent(this.i, this.j, this.k);
}

class ChangeToBStateEvent extends MyEvent {}

// Define the states
class MyState {
  final int i;
  final int j;
  final int k;

  MyState(this.i, this.j, this.k);
}

class BState extends MyState {
  BState(int i, int j, int k) : super(i, j, k);
}

class HState extends MyState {
  HState(int i, int j, int k) : super(i, j, k);
}

class S0State extends MyState {
  S0State() : super(0, 0, 0);
}

class STState extends MyState {
  STState() : super(0, 0, 0);
}

class EState extends S0State {
  EState() : super();
}

// Define the cubit
// Define the cubit
class MyCubit extends Cubit<MyState> {
  MyCubit() : super(S0State());

  void bStateTransition(int i, int j, int k) {
    if (i < 3) {
      emit(BState(i + 1, j, k));
    } else if (j < 2) {
      emit(HState(i, j, k + 1));
    } else
      emit(EState());
  }

  void hStateTransation(int i, int j, int k) {
    emit(BState(i, j + 1, k));
  }

  stbStateTransition() {
    emit(STState());
  }

  void eStateTransition() {
    emit(S0State());
  }

  void changeToBState() {
    final currentState = state as S0State;
    emit(BState(currentState.i, currentState.j, currentState.k));
  }
}
