import 'package:flutter/cupertino.dart';

import '../bynd_interface.dart';

mixin NavKey {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static BuildContext context = navKey.currentContext!;
}

extension Navigate on ByndInterface {
  CupertinoPageRoute<Object?> _pageRoute(Widget page) {
    return CupertinoPageRoute(
      builder: (context) => page,
    );
  }

  Future to(Widget page) => Navigator.push(NavKey.context, _pageRoute(page));

  Future off(Widget page) =>
      Navigator.pushReplacement(NavKey.context, _pageRoute(page));

  Future removeUntilTo(Widget page,
      [bool Function(Route<dynamic> route)? predicate]) {
    return Navigator.pushAndRemoveUntil(
      NavKey.context,
      _pageRoute(page),
      predicate ?? (Route<dynamic> route) => route.isFirst,
    );
  }

  void back() => Navigator.pop(NavKey.context);
}
