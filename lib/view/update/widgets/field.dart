import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/controller/bloc/randPwd/rand_pwd.dart';
import 'package:gestionnairebloc/view/update/update_type.dart';

class Field extends StatelessWidget {
  Field(
      {super.key,
      required this.controller,
      required this.label,
      required this.type});

  final TextEditingController controller;
  final String label;
  final UpdateType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: BlocBuilder<RandomPwd, String>(builder: (context, state) {
        if (label == "password" && state.isNotEmpty) {
          controller.text = state;
        }
        return TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              label: Text(
                label,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
        );
      }),
    );
  }
}
