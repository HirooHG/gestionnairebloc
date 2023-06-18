
import 'package:flutter/material.dart';
import 'package:gestionnairebloc/router/routes.dart';
import 'package:gestionnairebloc/view/nav/app_bar.dart';
import 'package:go_router/go_router.dart';

import 'package:gestionnairebloc/view/auth_view.dart';
import 'package:gestionnairebloc/view/home_view.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.auth.path,
          name: Routes.auth.name,
          builder: (context, state) => AuthView()
        ),
        GoRoute(
          path: Routes.home.path,
          name: Routes.home.name,
          builder: (context, state) => HomeView() 
        )
      ]
    )
  ]
);
