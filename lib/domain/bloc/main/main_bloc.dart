
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
  }

  void init(Init event, Emitter<MainState> emit) async {
    emit(MainLoading());

    var pwds = await handler.getPwds();
    print(pwds.map((e) => e.pwd));

    emit(MainLoaded(pwds: pwds, allPwds: [...pwds]));
  }


  void crud(Crud event, Emitter<MainState> emit) async {
    var pwds = (state as MainLoaded).pwds;
    var allPwds = (state as MainLoaded).allPwds;

    emit(MainLoading());

    if(event is Delete) {
      handler.delete(event.pwd);
      pwds.remove(event.pwd);
    } else if(event is Update) {
      handler.update(event.pwd);
    } else if(event is Create) {
      handler.create(event.pwd);
      pwds.add(event.pwd);
      allPwds.add(event.pwd);
    } else {
      pwds = await handler.getPwds(); 
      allPwds = [...pwds];
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
