
import 'package:bloc/bloc.dart';

import 'package:gestionnairebloc/modelview/password.dart';
import 'package:gestionnairebloc/model/hivehandler.dart';

abstract class GestEvent {
  const GestEvent();
}
class ChangePasswordGEvent extends GestEvent {
  const ChangePasswordGEvent({required this.passwordG});

  final PasswordG passwordG;
}

abstract class GestState {
  List<Password> passwords;
  PasswordG? passwordG;

  HiveHandler hiveHandler;

  GestState({
    required this.hiveHandler,
    required this.passwords,
    required this.passwordG
  });
}
class InitGestState extends GestState {
  InitGestState({
    required super.hiveHandler,
    required super.passwords,
    required super.passwordG
  }) {
    init();
  }

  void init() async {
    passwords  = await hiveHandler.readPasswords();
    passwordG = await hiveHandler.readPasswordG();
  }
}
class ChangedPasswordGState extends GestState {
  ChangedPasswordGState({
    required super.hiveHandler,
    required super.passwords,
    required super.passwordG
  });

  Future<void> change(PasswordG pwd) async {
    if(passwordG == null) {
      await hiveHandler.create(pwd, (await hiveHandler.passwordGBox));
    } else {
      await hiveHandler.update(pwd);
    }
  }
}

class GestBloc extends Bloc<GestEvent, GestState> {
  GestBloc() : super(InitGestState(
    hiveHandler: HiveHandler(),
    passwords: [],
    passwordG: PasswordG.empty()
  )) {
    on<GestEvent>(onGestEvent);
  }

  void onGestEvent(event, emit) async {
    switch(event.runtimeType) {
      case ChangePasswordGEvent:
        final nextState = ChangedPasswordGState(
          hiveHandler: state.hiveHandler,
          passwords: state.passwords,
          passwordG: state.passwordG
        );
        await nextState.change((event as ChangePasswordGEvent).passwordG);
        emit(nextState);
        break;
    }
  }
}