
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/modelview/gestbloc.dart';
import 'package:gestionnairebloc/modelview/pagamanager.dart';
import 'package:gestionnairebloc/modelview/password.dart';
import 'package:gestionnairebloc/view/pwdsview.dart';

class PwdView extends StatelessWidget {
  PwdView({super.key});

  double width = 0;
  double height = 0;

  TextEditingController pwdController = TextEditingController();

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
      body: SafeArea(
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: BlocBuilder<GestBloc, GestState>(
            builder: (context, passwordState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if(passwordState.passwordG == null) const Text(
                    "New general password",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: pwdController,
                      cursorColor: Colors.black,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ubuntu"
                      ),
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        label: Text(
                          "password",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu"
                          ),
                        )
                      ),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextButton(
                      onPressed: () {
                        var pwd = pwdController.text;
                        if(pwd.isEmpty) return;

                        if(passwordState.passwordG == null) {
                          var pwdG = PasswordG(pwd: pwd);
                          BlocProvider.of<GestBloc>(context).add(ChangePasswordGEvent(passwordG: pwdG));
                          BlocProvider.of<PageManager>(context).change(true);
                        }
                        else if(passwordState.passwordG!.pwd == pwd) {
                          BlocProvider.of<PageManager>(context).change(true);
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(
                                child: Text(
                                  "Nope, wrong one"
                                ),
                              ),
                            )
                          );
                        }
                      },
                      child: const Text(
                        "continue",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu"
                        ),
                      )
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}