
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/domain/bloc/auth/auth_bloc.dart';
import 'package:gestionnairebloc/router/router.dart' show router;

class GestionnaireApp extends StatelessWidget {
  const GestionnaireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc()..add(InitAuth())
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false
      )
    );
  }
}
