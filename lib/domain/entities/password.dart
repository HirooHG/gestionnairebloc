import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:gestionnairebloc/domain/crypt_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

@JsonSerializable()
class Password {
  int? id;
  String? website;
  String? identifier;
  String? pwd;

  bool? identifierVisible;
  bool? pwdVisible;

  Password(
      {this.id,
      required this.website,
      required this.identifier,
      required this.pwd});

  Password.empty()
      : id = -1,
        website = "",
        identifier = "",
        pwd = "";

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);

  String getPwdUncrypted() {
    return pwd != null
        ? EncryptData.decryptAES(encrypt.Encrypted.fromBase64(pwd!))
        : "";
  }

  String getIdeUncrypted() {
    return identifier != null
        ? EncryptData.decryptAES(encrypt.Encrypted.fromBase64(identifier!))
        : "";
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
