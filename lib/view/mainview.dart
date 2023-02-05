
import 'package:flutter/material.dart';
import 'package:gestionnairebloc/modelview/pagamanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pwdsview.dart';
import 'pwdview.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<PageManager, bool>(
    builder: (context, pagemanagerState) => (pagemanagerState) ? PwdsView() : PwdView()
  );
}