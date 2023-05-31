
part of '../storage.dart';

abstract class HiveBoxInitializer<T> {
  Future<void> _openBox();
  void _registerAdapter();
}

class StorageLocalManager {
  static StorageLocalManager? _instance;
  static StorageLocalManager get instance {
    _instance ??= StorageLocalManager._();
    return _instance!;
  }

  StorageLocalManager._();

  Future<void> initialize() async {
    await Hive.initFlutter();
    await openAllBoxes($Bynd.$StorageContainer.initializers);
  }

  Future<void> openAllBoxes(List<HiveBoxInitializer> initializers) async {
    for (var initializer in initializers) {
      initializer._registerAdapter();
      await initializer._openBox();
    }
  }
}
