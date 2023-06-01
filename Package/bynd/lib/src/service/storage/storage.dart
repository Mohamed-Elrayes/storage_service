import '../../../bynd.dart';
import '../../bynd_interface.dart';

export 'impl/impl.dart';

extension LocalStorage on ByndInterface {
  StorageLocalManager get localStorageManager => StorageLocalManager.instance;
}
