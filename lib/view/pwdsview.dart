
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/modelview/gestbloc.dart';

class PwdsView extends StatelessWidget {
  PwdsView({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 2.0,
        shadowColor: Colors.white,
        title: const Text(
          "Gestionnaire",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Ubuntu",
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF1a1a1a),
        child: BlocBuilder<GestBloc, GestState>(
          builder: (context, gestState) {
            var pwds = gestState.passwords;
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    ),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      label: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                        ),
                      )
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}