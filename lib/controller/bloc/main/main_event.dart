
part of 'main_bloc.dart';

abstract class MainEvent {}
abstract class Crud extends MainEvent {}

class Init extends MainEvent {}
class Error extends MainEvent {
  final String msg;

  Error({required this.msg});
}
class ModifyErrorEvent extends Error {
  ModifyErrorEvent({required super.msg});
}
class AddErrorEvent extends Error {
  AddErrorEvent({required super.msg});
}

// CRUD
class Read extends Crud {}
class Create extends Crud {
  Create({required this.pwd});

  final Password pwd;
}
class Update extends Crud {
  Update({required this.pwd});

  final Password pwd;
}
class Delete extends Crud {
  Delete({required this.pwd});

  final Password pwd;
}


class Search extends MainEvent {
  Search({required this.value});

  final String value;
}
