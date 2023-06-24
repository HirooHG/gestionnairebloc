
import 'package:bloc/bloc.dart';

import 'package:gestionnairebloc/domain/entities/password_g.dart';
import 'package:gestionnairebloc/data/hivehandler.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  HiveHandler handler = HiveHandler();

  AuthBloc() : super(NotConnected()) {
    on<Connect>(tryConnect);

    on<CreatePwd>(createPwd);

    on<InitAuth>(initAuth);
  }

  void initAuth(InitAuth event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    var pwdG = handler.getAuth();

    if(pwdG == null) {
      emit(FirstOpen());
    } else {
      emit(NotConnected());
    }
  }

  void createPwd(CreatePwd event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    if(verifPwd(event.passwd)) {
      await handler.updateAuth(PasswordG(pwd: event.passwd));
      emit(Connected(passwordG: PasswordG(pwd: event.passwd)));
    } else {
      emit(FailedCreate(msg: "Not a good pwd, 8 char required"));
    }
  }

  bool verifPwd(String pwd) {
    return pwd.length >= 8;
  }

  void tryConnect(Connect event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    var pwdG = handler.getAuth();

    if(event.passwd == pwdG!.pwd) {
      emit(Connected(passwordG: pwdG));
    } else {
      emit(FailedConnect(msg: "Not the good pwd"));
    }
  }
}
