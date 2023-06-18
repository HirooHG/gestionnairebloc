
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/domain/bloc/main/main_bloc.dart';
import 'package:gestionnairebloc/view/home/pwds_list.dart';
import 'package:gestionnairebloc/view/home/search_bar.dart';
 
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return BlocProvider(
    create: (_) => MainBloc()..add(Init()),
      child: Container(
        width: width,
        color: const Color(0xFF1a1a1a),
        child: Column(
          children: [
            SearchBar(),
            const PwdsList()
          ],
        ),
      ),
    );
  }
}
