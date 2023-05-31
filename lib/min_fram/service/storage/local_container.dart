part of './storage.dart';

///* 1 => SecureDataType
mixin SecureDataType {
  final SecureService secureKey = SecureService(key: 'secure');
}

///* 2 => BoxesType
mixin BoxesType {
  ///! initialize Boxes
  List<BoxService> get _boxesTypeInit => [boxA];

  ///
  final boxA = BoxService<String>(boxName: 'Start');
}

///* 3 => AdapterType
mixin AdapterType {
  ///! initialize the adapters
  List<BoxService> get _adapterType => [boxB];

  ///
  final boxB = BoxService<LocalUserModel>(
      boxName: 'Adapter', initAdapter: LocalUserModelAdapter());
}
