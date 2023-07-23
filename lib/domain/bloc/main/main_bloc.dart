
import 'package:bloc/bloc.dart';
import 'package:gestionnairebloc/domain/entities/password.dart';
import 'package:gestionnairebloc/data/database_handler.dart';

part 'main_state.dart';
part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final DatabaseHandler handler = DatabaseHandler();

  MainBloc() : super(MainLoading()) {
    on<Crud>(crud);
    on<Search>(search);
    on<Init>(init);
    on<Error>(error);
  }

  void error(Error event, Emitter<MainState> emit) {
    var allPwds = (state as MainLoaded).allPwds;
    var pwds = (state as MainLoaded).pwds;

    if(event is AddErrorEvent) {
      emit(AddErrorState(allPwds: allPwds, pwds: pwds, msg: event.msg));
    } else {
      emit(ModifyErrorState(allPwds: allPwds, pwds: pwds, msg: event.msg));
    }
  }

  void init(Init event, Emitter<MainState> emit) async {
    emit(MainLoading());

    var pwds = await handler.getPwds();

    emit(MainLoaded(pwds: pwds, allPwds: [...pwds]));
  }


  void crud(Crud event, Emitter<MainState> emit) async {
    emit(MainLoading());

    var pwds = await handler.getPwds(); 
    var allPwds = [...pwds];

    if(event is Delete) {
      await handler.delete(event.pwd);
      pwds.removeWhere((e) => e.id == event.pwd.id);
      allPwds.removeWhere((e) => e.id == event.pwd.id);
    } else if(event is Update) {
      await handler.update(event.pwd);
      final pwd = pwds.singleWhere((element) => element.id == event.pwd.id);

      pwd.website = event.pwd.website;
      pwd.pwd = event.pwd.pwd;
      pwd.identifier = event.pwd.identifier;
    } else if(event is Create) {
      await handler.create(event.pwd);
      pwds.add(event.pwd);
      allPwds.add(event.pwd);
    }
    
    emit(MainLoaded(pwds: pwds, allPwds: allPwds));
  }

  void search(Search event, Emitter<MainState> emit) {
    var allPwds = (state as MainLoaded).allPwds;
    emit(MainLoading());
    var rgx = RegExp("^(${event.value.toUpperCase()}).*\$");

    var pwds = allPwds.where((element) => element.website != null && rgx.hasMatch(element.website!.toUpperCase())).toList();

    emit(MainLoaded(pwds: pwds, allPwds: allPwds));
  }
}
