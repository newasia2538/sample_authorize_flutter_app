import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorageService{

  final FlutterSecureStorage storage;

  AppSecureStorageService({required FlutterSecureStorage this.storage});

  Future<void> saveValueByKey(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getValueByKey(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteValueByKey(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}