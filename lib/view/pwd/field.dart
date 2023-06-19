
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/domain/bloc/randPwd/rand_pwd.dart';

class Field extends StatelessWidget {
  Field({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: BlocBuilder<RandomPwd, String>(
        builder: (context, state) {
          if(label == "password") {
            controller.text = state;
          }
          return TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.black
            ),
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              label: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          );
        }
      ),
    );
  }
}
