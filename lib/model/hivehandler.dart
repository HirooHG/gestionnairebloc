
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:gestionnairebloc/modelview/password.dart';

class HiveHandler {

  Future<Box<Password>> get passwordBox async {
    final encryptionKey = base64Url.decode(dotenv.env["KEY"]!);
    return await Hive.openBox<Password>(
      "passwords",
      encryptionCipher: HiveAesCipher(encryptionKey)
    );
  }
  Future<Box<PasswordG>> get passwordGBox async {
    final encryptionKey = base64Url.decode(dotenv.env["KEY"]!);
    return await Hive.openBox<PasswordG>(
        "passwordG",
        encryptionCipher: HiveAesCipher(encryptionKey)
    );
  }

  // Create
  Future<void> create(HiveObject obj, Box box) async {
    if(!obj.isInBox) {
      await box.put("passwordG", obj);
    }
  }
  // Read
  Future<List<Password>> readPasswords() async {
    return (await passwordBox).values.toList();
  }
  Future<PasswordG?> readPasswordG() async {
    return (await passwordGBox).get("passwordG");
  }
  // Update
  Future<void> update(HiveObject obj) async {
    if(obj.box != null) {
      await obj.box!.put(obj.key, obj);
    }
  }
  // Delete
  Future<void> delete(HiveObject obj) async {
    if(obj.isInBox) {
      await obj.box!.delete(obj.key);
    }
  }
}