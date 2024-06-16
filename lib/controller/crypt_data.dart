import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:gestionnairebloc/utils/storage/key_storage.dart';

class EncryptData {
  static final KeyStorage storage = KeyStorage();

  static late final encrypt.Key key;
  static late final encrypt.IV iv;
  static late final encrypt.Encrypter encrypter;

  static Future<void> init() async {
    var keySqf = await storage.keySqf;
    var ivSqf = await storage.ivSqf;

    if (keySqf == null) {
      await storage.initSqf();

      keySqf = await storage.keySqf;
      ivSqf = await storage.ivSqf;
    }

    key = encrypt.Key.fromBase64(keySqf!);
    iv = encrypt.IV.fromBase64(ivSqf!);
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  static String encryptAES(String plainText) {
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  static String decryptAES(encrypt.Encrypted text) {
    return encrypter.decrypt(text, iv: iv);
  }
}
