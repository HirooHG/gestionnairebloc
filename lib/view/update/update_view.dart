
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:gestionnairebloc/domain/bloc/main/main_bloc.dart';
import 'package:gestionnairebloc/domain/bloc/randPwd/rand_pwd.dart';
import 'package:gestionnairebloc/domain/crypt_data.dart';
import 'package:gestionnairebloc/domain/entities/password.dart';
import 'package:gestionnairebloc/router/routes.dart';
import 'package:gestionnairebloc/view/update/update_type.dart';
import 'package:gestionnairebloc/view/update/widgets/field.dart';
import 'package:gestionnairebloc/view/update/widgets/rand_button.dart';
import 'package:go_router/go_router.dart';

class UpdateView extends StatefulWidget {

  const UpdateView.add({super.key}) :
    type = UpdateType.add,
    pwd = null;

  const UpdateView.modify({super.key, required Password psswd}) :
    type = UpdateType.modify,
    pwd = psswd;
  
  final UpdateType type;
  final Password? pwd;

  @override
  State<StatefulWidget> createState() {
    return _UpdateViewState();
  }
}

class _UpdateViewState extends State<UpdateView> {

  final TextEditingController controllerWs = TextEditingController();
  final TextEditingController controllerIde = TextEditingController();
  final TextEditingController controllerPwd = TextEditingController();

  void update() {
    var ws = controllerWs.text;
    var ide = controllerIde.text;
    var pwdStr = controllerPwd.text;

    if(ws.isNotEmpty && ide.isNotEmpty && pwdStr.length >= 12) {
      if(widget.type == UpdateType.modify) {
        widget.pwd!.website = ws;
        widget.pwd!.identifier = EncryptData.encryptAES(ide);
        widget.pwd!.pwd = EncryptData.encryptAES(pwdStr);

        BlocProvider.of<MainBloc>(context).add(Update(pwd: widget.pwd!));
        context.go(Routes.home.path);
      } else {
        var pwd = Password(website: ws, identifier: EncryptData.encryptAES(ide), pwd: EncryptData.encryptAES(pwdStr));

        BlocProvider.of<MainBloc>(context).add(Create(pwd: pwd));
        context.go(Routes.home.path);
      }
    } else {
      var msg = (pwdStr.length < 12) ? "password must be bigger than 12 !" : "Something is empty !";

      if(widget.type == UpdateType.modify) {
        BlocProvider.of<MainBloc>(context).add(ModifyErrorEvent(msg: msg));
      } else {
        BlocProvider.of<MainBloc>(context).add(AddErrorEvent(msg: msg));
      }
    }
  }

  void remove() {
    BlocProvider.of<MainBloc>(context).add(Delete(pwd: widget.pwd!));
    context.go(Routes.home.path);
  }

  @override
    void initState() {
      super.initState();

      if(widget.pwd != null) {
        controllerWs.text = widget.pwd!.website ?? "";
        controllerPwd.text = widget.pwd!.getPwdUncrypted();
        controllerIde.text = widget.pwd!.getIdeUncrypted();
      }
    }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RandomPwd(),
        ),
      ],
      child: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF1a1a1a),
          height: MediaQuery.of(context).size.height * .82,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.type.name} password",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              Field(controller: controllerWs, label: "website", type: widget.type),
              Field(controller: controllerIde, label: "identifier", type: widget.type),
              Field(controller: controllerPwd, label: "password", type: widget.type),
              BlocBuilder<MainBloc, MainState>(
                builder: (context, mainState) {
                  if(widget.type == UpdateType.modify && mainState is ModifyErrorState) {
                    return Text(
                      mainState.msg,
                      style: const TextStyle(
                        color: Colors.red
                      )
                    );
                  } else if (widget.type == UpdateType.add && mainState is AddErrorState) {
                    return Text(
                      mainState.msg,
                      style: const TextStyle(
                        color: Colors.red
                      )
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const RandButton(),
                    if(widget.type == UpdateType.modify) Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: remove,
                        child: const Text(
                          "remove",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: update,
                        child: Text(
                          widget.type.name,
                          style: const TextStyle(
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
      ),
    );
  }
}
