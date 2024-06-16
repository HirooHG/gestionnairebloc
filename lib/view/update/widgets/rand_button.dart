import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:gestionnairebloc/controller/bloc/randPwd/rand_pwd.dart';

class RandButton extends StatelessWidget {
  const RandButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(5)),
      child: TextButton(
          onPressed: () {
            BlocProvider.of<RandomPwd>(context).gen();
          },
          child: const Text(
            "rand",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
