
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class KeyStorage {

  final String auth = 'auth';
  final secureStorage = const FlutterSecureStorage();

  Future<void> init() async {
    await secureStorage.write(
      key: auth,
      value: base64UrlEncode(Hive.generateSecureKey()));
  }

  Future<String?> get keyAuth => secureStorage.read(key: auth);
}
