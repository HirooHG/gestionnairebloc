import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'gestapp.dart';
import 'package:gestionnairebloc/modelview/password.dart';

void main() async {
  await Hive.initFlutter();
  await dotenv.load();
  Hive.registerAdapter<Password>(PasswordTypeAdapter());
  Hive.registerAdapter<PasswordG>(PasswordGTypeAdapter());
  runApp(GestApp());
}