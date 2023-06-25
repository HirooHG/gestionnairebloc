import 'package:flutter/material.dart';
import 'package:gestionnairebloc/data/hivehandler.dart';
import 'package:gestionnairebloc/domain/crypt_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'gestionnaire_app.dart';
import 'package:gestionnairebloc/domain/entities/password_g.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<PasswordG>(PasswordGTypeAdapter());

  await HiveHandler.init();
  await EncryptData.init();

  runApp(const GestionnaireApp());
}
