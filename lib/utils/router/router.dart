import 'package:flutter/material.dart';
import 'package:gestionnairebloc/controller/entities/password.dart';
import 'package:gestionnairebloc/utils/router/routes.dart';
import 'package:gestionnairebloc/view/nav/app_bar.dart';
import 'package:gestionnairebloc/view/nav/bottom_nav_bar.dart';
import 'package:gestionnairebloc/view/update/update_view.dart';
import 'package:go_router/go_router.dart';

import 'package:gestionnairebloc/view/auth/auth_view.dart';
import 'package:gestionnairebloc/view/home/home_view.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: Routes.auth.path,
      name: Routes.auth.name,
      builder: (context, state) => AuthView()),
  ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          bottomNavigationBar: const CustomBottomNavBar(),
          appBar: CustomAppBar(),
          body: child,
        );
      },
      routes: [
        GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            builder: (context, state) => const HomeView()),
        GoRoute(
            path: Routes.add.path,
            name: Routes.add.name,
            builder: (context, state) => const UpdateView.add()),
        GoRoute(
            path: Routes.update.path,
            name: Routes.update.name,
            builder: (context, state) =>
                UpdateView.modify(psswd: state.extra! as Password)),
      ])
]);
