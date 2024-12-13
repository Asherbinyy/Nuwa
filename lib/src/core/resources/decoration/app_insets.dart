import 'package:flutter/cupertino.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

class AppInsets {
  AppInsets._();
  static const double _defaultScreenPadding = 32.0;
  static EdgeInsets get defaultScreenALL =>
      EdgeInsets.all(_defaultScreenPadding.toRad());
  static EdgeInsets get defaultScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: _defaultScreenPadding.toW());
  static EdgeInsets get defaultScreenVertical =>
      EdgeInsets.symmetric(vertical: _defaultScreenPadding.toH());
  static EdgeInsets zero = EdgeInsets.zero;
}
