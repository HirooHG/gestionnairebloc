import 'package:flutter/material.dart';
import 'package:gestionnairebloc/model/hivehandler.dart';
import 'package:gestionnairebloc/controller/crypt_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'gestionnaire_app.dart';
import 'package:gestionnairebloc/controller/entities/password_g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<PasswordG>(PasswordGTypeAdapter());

  await HiveHandler.init();
  await EncryptData.init();

  runApp(const GestionnaireApp());
}
