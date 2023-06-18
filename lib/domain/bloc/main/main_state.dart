
part of 'main_bloc.dart';

abstract class MainState {}

class MainLoading extends MainState {}
class MainError extends MainState {
  MainError({required this.msg});
  
  final String msg;
}

class MainLoaded extends MainState {

  List<Password> allPwds;
  List<Password> pwds;

  MainLoaded({required this.pwds, required this.allPwds});
}
