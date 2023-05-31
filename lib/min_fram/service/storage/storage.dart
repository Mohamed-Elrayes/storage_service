import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../../../src/core/adapters/local_user_model.dart';
import '../../bynd.dart';
import '../../bynd_interface.dart';

part './impl/box_service.dart';
part './impl/init_storage_container.dart';
part './impl/secure_service.dart';
part './impl/storage_local_manager.dart';
part './local_container.dart';

extension LocalStorage on ByndInterface {
  InitStorageContainer get $StorageContainer => InitStorageContainer.instance;
}
