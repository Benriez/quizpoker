import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events
abstract class MyEvent {}

class UpdateValuesEvent extends MyEvent {
  final int i;
  final int j;
  final int k;

  UpdateValuesEvent(this.i, this.j, this.k);
}

// Define the states
class MyState {
  final int i;
  final int j;
  final int k;

  MyState(this.i, this.j, this.k);
}

// Define the cubit
class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyState(0, 0, 0));

  void updateValues(int i, int j, int k) {
    // Perform any business logic or calculations based on the parameters

    // Emit a new state
    emit(MyState(i, j, k));
  }
}
