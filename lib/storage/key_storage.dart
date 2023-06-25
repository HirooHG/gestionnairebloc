
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class KeyStorage {

  final secureStorage = const FlutterSecureStorage();

  Future<void> initHive() async {
    await secureStorage.write(
      key: KeySecure.auth.name,
      value: base64UrlEncode(Hive.generateSecureKey()));
  }

  Future<void> initSqf() async {
    await secureStorage.write(
      key: KeySecure.key.name,
      value: 'patou is god 4 life and eternity'
    );

    await secureStorage.write(
      key: KeySecure.iv.name,
      value: '8PzGKSMLuqSm0MVbviaWHA=='
    );
  }

  Future<void> writeToSecure(KeySecure ks, String value) async {
    await secureStorage.write(
      key: ks.name,
      value: value
    );
  }

  Future<String?> get keyAuth => secureStorage.read(key: KeySecure.auth.name);

  Future<String?> get keySqf => secureStorage.read(key: KeySecure.key.name);
  Future<String?> get ivSqf => secureStorage.read(key: KeySecure.iv.name);
}

enum KeySecure {
  iv(),
  key(),
  auth();

  const KeySecure();
}
