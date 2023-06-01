part of './local_container.dart';

final InitStorageContainer $StorageContainer = InitStorageContainer();


class InitStorageContainer with SecureDataType, BoxesType, AdapterType {
  ///! initializers list for [BoxService] only
  /// use to open Boxes in [StorageLocalManager]
  List<BoxService> get initializerBoxes => <BoxService>[
        ...super._boxesTypeInitial,
        ...super._adapterTypeInitial,
      ];
}
