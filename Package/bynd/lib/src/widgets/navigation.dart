import 'package:flutter/cupertino.dart';

import '../bynd_interface.dart';

extension Navigate on ByndInterface {
  CupertinoPageRoute<Object?> _pageRoute(Widget page) {
    return CupertinoPageRoute(
      builder: (context) => page,
    );
  }

  void to(Widget page) => Navigator.push(context, _pageRoute(page));

  void off(Widget page) => Navigator.pushReplacement(context, _pageRoute(page));

  void removeUntilTo(Widget page,
      [bool Function(Route<dynamic> route)? predicate]) {
    Navigator.pushAndRemoveUntil(
      context,
      _pageRoute(page),
      predicate ?? (Route<dynamic> route) => route.isFirst,
    );
  }

  void back() => Navigator.pop(context);
}
