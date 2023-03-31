import 'package:encrypt/encrypt.dart' as aes;

const String cryptKey = 'KiR2aWV0I25hbUBuZXQhKg==';

class AES {
  static String encrypt(String data) {
    final key = aes.Key.fromBase64(cryptKey);
    final iv = aes.IV.fromBase64(key.base64);
    final encrypter =
        aes.Encrypter(aes.AES(key, mode: aes.AESMode.cbc, padding: 'PKCS7'));
    return encrypter.encrypt(data, iv: iv).base64;
  }

  static String decrypt(String data) {
    String result = '';
    final key = aes.Key.fromBase64(cryptKey);
    final iv = aes.IV.fromBase64(key.base64);
    final encrypter =
        aes.Encrypter(aes.AES(key, mode: aes.AESMode.cbc, padding: 'PKCS7'));
    result = encrypter.decrypt64(data, iv: iv);
    return result;
  }
}
