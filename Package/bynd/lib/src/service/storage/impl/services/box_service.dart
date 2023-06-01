part of '../impl.dart';

class BoxService<T> implements HiveBoxInitializer<T> {
  BoxService({required String boxName, TypeAdapter<T>? initAdapter})
      : _initAdapter = initAdapter,
        _boxName = boxName;

  /// A Hive Box
  late Box<T> hiveBox;
  final String _boxName;

  String get boxName => _boxName;

  final TypeAdapter<T>? _initAdapter;

  TypeAdapter<T>? get initAdapter => _initAdapter;

  // Box<T> get boxInstance => hiveBox;

  Future<void> delete() async {
    await hiveBox.delete(boxName);
  }

  T? get() {
    final data = hiveBox.get(boxName);
    return data;
  }

  List<T> getAll() {
    return hiveBox.values.toList();
  }

  bool has() {
    return hiveBox.containsKey(boxName);
  }

  Future<void> put(T data) async {
    await hiveBox.put(boxName, data);
  }

  Future<void> clear() async {
    await hiveBox.clear();
  }

  @override
  Future<void> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      hiveBox = await Hive.openBox<T>(boxName);
    } else {
      hiveBox = Hive.box<T>(boxName);
    }
  }

  @override
  void _registerAdapter() {
    if (initAdapter != null) {
      Hive.registerAdapter<T>(initAdapter!);
    }
  }
}
