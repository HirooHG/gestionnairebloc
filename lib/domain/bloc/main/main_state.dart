
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

class MainUpdateError extends MainLoaded {

  final String msg;

  MainUpdateError({required super.pwds, required super.allPwds, required this.msg});
}

class AddErrorState extends MainUpdateError {
  AddErrorState({required super.pwds, required super.allPwds, required super.msg});
}

class ModifyErrorState extends MainUpdateError {
  ModifyErrorState({required super.pwds, required super.allPwds, required super.msg});
}
