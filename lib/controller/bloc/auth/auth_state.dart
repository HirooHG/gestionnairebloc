
part of 'auth_bloc.dart';

abstract class AuthState {}

// gen
class AuthLoading extends AuthState {}
abstract class AuthError extends AuthState {
  AuthError({required this.msg});
  
  final String msg;
}

class FailedCreate extends AuthError {
  FailedCreate({required super.msg});
}
class FailedConnect extends AuthError {
  FailedConnect({required super.msg});
}

class FirstOpen extends AuthState {}
class NotConnected extends AuthState {}
class Connected extends AuthState {
  final PasswordG passwordG;

  Connected({
    required this.passwordG
  });
}

