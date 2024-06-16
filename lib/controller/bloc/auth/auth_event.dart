
part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}
class InitAuth extends AuthEvent {}

class Connect extends AuthEvent {
  const Connect({required this.passwd});

  final String passwd;
}

class CreatePwd extends AuthEvent {
  const CreatePwd({required this.passwd});

  final String passwd;
}
