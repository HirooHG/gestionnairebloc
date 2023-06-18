

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/domain/bloc/main/main_bloc.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      width: width * .8,
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
        onSubmitted: (value) {
          BlocProvider.of<MainBloc>(context).add(Search(value: value));
        },
      ),
    );
  }
}
