
import 'dart:convert';

import 'package:gestionnairebloc/storage/key_storage.dart';
import 'package:hive/hive.dart';

import 'package:gestionnairebloc/domain/entities/password_g.dart';

class HiveHandler {

  static Box<PasswordG>? authBox;

  static Future<void> init() async {
    final storage = KeyStorage();
    final authKey = await storage.keyAuth;

    if(authKey == null) {
      await storage.init();

      authBox = await Hive.openBox<PasswordG>(
        "auth",
        encryptionCipher: HiveAesCipher(base64Url.decode(authKey!))
      );
    } else {
      authBox = await Hive.openBox<PasswordG>(
        "auth",
        encryptionCipher: HiveAesCipher(base64Url.decode(authKey))
      );
    }
  }

  PasswordG? getAuth() {
    return authBox!.get('main');
  }
  Future<void> updateAuth(PasswordG pwd) async {
    await authBox!.put('main', pwd);
  }
}
