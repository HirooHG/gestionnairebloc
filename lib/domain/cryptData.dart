import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptData{

  String? decrypted;
  encrypt.Key? key;
  encrypt.IV? iv;
  encrypt.Encrypted? crypt;
  encrypt.Encrypter? cryptable;

  EncryptData(){
    key = encrypt.Key.fromUtf8('patou is god 4 life and eternity');
    iv = encrypt.IV.fromBase64('8PzGKSMLuqSm0MVbviaWHA==');
    cryptable = encrypt.Encrypter(encrypt.AES(key!));
  }

  String encryptAES(String plainText) {
    crypt = cryptable!.encrypt(plainText, iv: iv);
    return crypt!.base64;
  }

  String decryptAES(encrypt.Encrypted text) {
    crypt = text;
    decrypted = cryptable!.decrypt(crypt!, iv: iv);
    return decrypted!;
  }
}