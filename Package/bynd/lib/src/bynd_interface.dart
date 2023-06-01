import 'package:flutter/widgets.dart';

abstract class ByndInterface {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigationKey.currentContext!;
}

class ByndImpl extends ByndInterface {}
