import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:gestionnairebloc/domain/crypt_data.dart';

class Password {

  int? id;
  String? website;
  String? identifier;
  String? pwd;

  bool? identifierVisible;
  bool? pwdVisible;

  Password({
    this.id,
    required this.website,
    required this.identifier,
    required this.pwd
  });

  Password.empty() :
      id = -1,
      website = "",
      identifier = "",
      pwd = "";

  Password.fromMap(Map<String, Object?> map)
    : id = int.parse(map["id"].toString()),
      website = map["website"].toString(),
      identifier = map["identifier"].toString(),
      pwd = map["pwd"].toString();

  String getPwdUncrypted() {
    return pwd != null ? EncryptData.decryptAES(encrypt.Encrypted.fromBase64(pwd!)) : "";
  }

  String getIdeUncrypted() {
    return identifier != null ? EncryptData.decryptAES(encrypt.Encrypted.fromBase64(identifier!)) : "";
  }

  @override
  String toString() {
    return "website: $website\nidentifier: $identifier\npwd: $pwd\n";
  }

  Map<String, String?> toMap() {
    return {
      "website": website,
      "identifier": identifier,
      "pwd": pwd
    };
  }
}
