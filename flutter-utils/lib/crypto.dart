// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart';

class Crytpo {
  static String encrypt(String plainText, String keyText, String ivText) {
    final key = Key.fromBase16(keyText);
    final iv = IV.fromBase16(ivText);
    final cipher = Encrypter(AES(key, mode: AESMode.ctr, padding: null));
    return cipher.encrypt(plainText, iv: iv).base64;
  }

  static String decrypt(String cipherText, String keyText, String ivText) {
    final key = Key.fromBase16(keyText);
    final iv = IV.fromBase16(ivText);
    final cipher = Encrypter(AES(key, mode: AESMode.ctr, padding: null));
    final Encrypted data = Encrypted.fromBase64(cipherText);
    return cipher.decrypt(data, iv: iv);
  }

  static String md5(String data) {
    return crypto.md5.convert(utf8.encode(data)).toString();
  }

  static Future<String> md5File(String filename) async {
    final input = File(filename);
    if (!input.existsSync()) {
      return '';
    }
    final digest = await crypto.md5.bind(input.openRead()).first;
    return digest.toString();
  }

  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  ///Base64解密
  static String decodeBase64(String data){
    return String.fromCharCodes(base64Decode(data));
  }
}
