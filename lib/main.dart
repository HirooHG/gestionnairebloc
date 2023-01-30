import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'gestapp.dart';

void main() async {
  await Hive.initFlutter();
  runApp(GestApp());
}