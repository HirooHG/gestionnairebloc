
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/modelview/gestbloc.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {

    if(!isLoaded) {
      print("yay");
      BlocProvider.of<GestBloc>(context).add(const InitGestEvent());
      isLoaded = true;
    }

    return Scaffold(
      body: Container(

      ),
    );
  }
}