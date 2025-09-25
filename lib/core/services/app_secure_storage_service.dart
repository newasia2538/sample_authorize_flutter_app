import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorageService{

  final _storage = FlutterSecureStorage(aOptions: const AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<void> saveValueByKey(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  Future<String?> getValueByKey(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteValueByKey(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}