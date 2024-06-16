import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/controller/bloc/auth/auth_bloc.dart';
import 'package:gestionnairebloc/controller/bloc/main/main_bloc.dart';
import 'package:gestionnairebloc/utils/router/router.dart' show router;

class GestionnaireApp extends StatelessWidget {
  const GestionnaireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => AuthBloc()..add(InitAuth())),
          BlocProvider<MainBloc>(create: (_) => MainBloc()..add(Init())),
        ],
        child: MaterialApp.router(
            routerConfig: router, debugShowCheckedModeBanner: false));
  }
}
