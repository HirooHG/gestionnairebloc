
import 'package:bloc/bloc.dart';

abstract class GestEvent {
  const GestEvent();
}
class InitGestEvent extends GestEvent {
  const InitGestEvent();
}

abstract class GestState {
  GestState();
}
class InitGestState extends GestState {
  InitGestState();
}

class GestBloc extends Bloc<GestEvent, GestState> {
  GestBloc() : super(InitGestState()) {
    on<GestEvent>(onGestEvent);
  }

  void onGestEvent(event, emit) {
    switch(event.runtimeType) {
      case InitGestEvent:
        InitGestState nextState = InitGestState(

        );
        emit(nextState);
        break;
    }
  }
}