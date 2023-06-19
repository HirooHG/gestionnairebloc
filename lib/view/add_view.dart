
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:gestionnairebloc/domain/bloc/main/main_bloc.dart';
import 'package:gestionnairebloc/domain/bloc/randPwd/rand_pwd.dart';
import 'package:gestionnairebloc/domain/entities/password.dart';
import 'package:gestionnairebloc/router/routes.dart';
import 'package:gestionnairebloc/view/pwd/field.dart';
import 'package:gestionnairebloc/view/pwd/rand_button.dart';
import 'package:go_router/go_router.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddViewState();
  }
}

class _AddViewState extends State<AddView> {

  final TextEditingController controllerWs = TextEditingController();
  final TextEditingController controllerIde = TextEditingController();
  final TextEditingController controllerPwd = TextEditingController();

  void createPwd() {
    var ws = controllerWs.text;
    var ide = controllerIde.text;
    var pwdStr = controllerPwd.text;

    if(ws.isNotEmpty && ide.isNotEmpty && pwdStr.length > 12) {
      var pwd = Password(website: ws, identifier: ide, pwd: pwdStr);
      BlocProvider.of<MainBloc>(context).add(Create(pwd: pwd));
      context.go(Routes.home.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomPwd(),
      child: Container(
        color: const Color(0xFF1a1a1a),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Field(controller: controllerWs, label: "website"),
            const SizedBox(height: 50),
            Field(controller: controllerIde, label: "identifier"),
            const SizedBox(height: 50),
            Field(controller: controllerPwd, label: "password"),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const RandButton(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextButton(
                      onPressed: createPwd,
                      child: const Text(
                        "add",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
