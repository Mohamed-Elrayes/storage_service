part of '../storage.dart';

// final StorageContainer storageContainer = StorageContainer.instance;

@immutable
class InitStorageContainer with SecureDataType, BoxesType, AdapterType {
  static InitStorageContainer? _instance;
  InitStorageContainer._();

  static InitStorageContainer get instance {
    _instance ??= InitStorageContainer._();
    return _instance!;
  }

  ///! initializers list for [BoxService] only
  /// use to open Boxes in [StorageLocalManager]
  List<BoxService> get initializers => <BoxService>[
        ...super._adapterType,
        ...super._boxesTypeInit,
      ];
}
