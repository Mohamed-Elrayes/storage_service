part of '../storage.dart';

@immutable
class SecureService {
  final String key;

  SecureService({required this.key})
      : _storage = _SecureStorageManager.instance.secureStorage;

  final FlutterSecureStorage _storage;

  Future<void> delete() async {
    return await _storage.delete(key: key);
  }

  Future<String?> get() async {
    return await _storage.read(key: key);
  }

  Future<void> put(String data) async {
    return await _storage.write(key: key, value: data);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

/// create Lazy singleton for  [FlutterSecureStorage]
class _SecureStorageManager {
  static _SecureStorageManager? _instance;
  _SecureStorageManager._();

  static _SecureStorageManager get instance {
    _instance ??= _SecureStorageManager._();
    return _instance!;
  }

  FlutterSecureStorage? _secureStorage;
  FlutterSecureStorage get secureStorage {
    _secureStorage ??= const FlutterSecureStorage();
    return _secureStorage!;
  }
}
