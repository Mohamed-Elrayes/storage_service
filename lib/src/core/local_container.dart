import 'package:bynd/bynd.dart';
import 'package:flutter_application_1/src/core/storage/adapters/local_user_model.dart';

part './init_storage_container.dart';

///* 1 => SecureDataType
mixin SecureDataType {
  final SecureService secureKey = SecureService(key: 'secure');
}

///* 2 => BoxesType
mixin BoxesType {
  ///! must initialize your box hear
  List<BoxService> get _boxesTypeInitial => <BoxService>[boxA, boxB];

  ///* Define your box
  BoxService<String> boxA = BoxService<String>(boxName: 'Start');
  BoxService<bool> boxB = BoxService<bool>(boxName: 'new');
}

///* 3 => AdapterType
mixin AdapterType {
  ///! must initialize your box hear
  List<BoxService> get _adapterTypeInitial => <BoxService>[adapterUser];

  ///* Define your box
  final adapterUser = BoxService<LocalUserModel>(
      boxName: 'Adapter', initAdapter: LocalUserModelAdapter());
}
