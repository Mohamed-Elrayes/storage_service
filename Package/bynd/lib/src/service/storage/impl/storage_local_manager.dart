part of 'impl.dart';

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

  Future<void> initialize(List<HiveBoxInitializer> initializeBox) async {
    await Hive.initFlutter();

    await openAllBoxes(initializeBox);
  }

  Future<void> openAllBoxes(List<HiveBoxInitializer> initializers) async {
    for (var initializer in initializers) {
      initializer._registerAdapter();
      await initializer._openBox();
    }
  }
}
