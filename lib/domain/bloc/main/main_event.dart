
part of 'main_bloc.dart';

abstract class MainEvent {}
abstract class Crud extends MainEvent {}

class Init extends MainEvent {}

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
