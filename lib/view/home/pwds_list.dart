
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/domain/bloc/main/main_bloc.dart';

class PwdsList extends StatefulWidget {
  const PwdsList({super.key});

  @override
    State<StatefulWidget> createState() {
      return _PwdsListState();
    }
}

class _PwdsListState extends State<PwdsList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, mainState) {
            if(mainState is MainLoaded) {
              return Column(
                children: mainState.pwds.map((e) => 
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(e.pwdVisible == true ? e.getPwdUncrypted() : "******"),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          (e.identifierVisible == true ? e.getIdeUncrypted() : e.website) ?? ""
                        )
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            e.pwdVisible = e.pwdVisible != null ? !e.pwdVisible! : true;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: e.getPwdUncrypted()));
                        },
                        icon: const Icon(Icons.copy),
                      ),
                      onTap: () {
                        setState(() {
                          e.identifierVisible = e.identifierVisible != null ? !e.identifierVisible! : true;
                        });
                      },
                    ),
                  )
                ).toList()
              );
            } else {
               return const CircularProgressIndicator(color: Colors.white);
            }
          }
        ),
      )
    );
  }
}
