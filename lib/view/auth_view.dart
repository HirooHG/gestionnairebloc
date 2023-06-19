
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestionnairebloc/domain/bloc/auth/auth_bloc.dart';
import 'package:gestionnairebloc/router/routes.dart';
import 'package:go_router/go_router.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if(state is Connected) {
                context.go(Routes.home.path);
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                if(authState is AuthLoading) {
                  return SizedBox(
                    width: width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white)
                      ]
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(authState is FirstOpen || authState is FailedCreate) const Text(
                        "New general password",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        )
                      ),
                      if(authState is AuthError) Text(
                        authState.msg,
                        style: const TextStyle(
                          color: Colors.red,
                          fontFamily: "Ubuntu",
                          fontSize: 15
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 50),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: TextField(
                          obscureText: true,
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

                            if(authState is FirstOpen || authState is FailedCreate) {
                              BlocProvider.of<AuthBloc>(context).add(CreatePwd(passwd: pwd));
                            } else {
                              BlocProvider.of<AuthBloc>(context).add(Connect(passwd: pwd));
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
                } 
              },
          ),
          ),
        ),
    )
    );
  }
}
