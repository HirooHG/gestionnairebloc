
import 'package:flutter/material.dart' hide SearchBar;

import 'package:gestionnairebloc/view/home/widgets/pwds_list.dart';
import 'package:gestionnairebloc/view/home/widgets/search_bar.dart';
 
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      color: const Color(0xFF1a1a1a),
      child: Column(
        children: [
          SearchBar(),
          const PwdsList()
        ],
      ),
    );
  }
}
