import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xff99CA89);
  static const Color background = Color(0xffF2F4F7);
  static const Color black = Color(0xff2C2C2C);
  static const Color white = Color(0xffFFFFFF);
  static Color get title => black;
  static Color get subtitle => const Color(0xff667085);
  static Color get icons => const Color(0xff98A2B3);
  static Color get caption => title;
  static Color get loaderActive => const Color(0xff6682E5);
  static Color get loaderCircleBackground => const Color(0xffF0F2FC);
  static Color get buttonDisabled => const Color(0xffC6DFB8);
  static Color get buttonActive => primary;
  static Color get cardShadow => Color(0x00101828);

  static Color get isConnected => const Color(0xff98CA88);
  static Color get isConnectedBg => const Color(0xffEEF8F1);
}
