
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/mainview.dart';
import 'modelview/gestbloc.dart';

class GestApp extends MaterialApp {
  GestApp({super.key}) : super(
    home: MultiBlocProvider(
      providers: [
        BlocProvider<GestBloc>(
          create: (context) => GestBloc()
        )
      ],
      child: MainView()
    ),
    debugShowCheckedModeBanner: false
  );
}