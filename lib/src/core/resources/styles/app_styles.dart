import 'package:flutter/material.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

import '../constants/app_constants.dart';
import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  static TextStyle withStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double lineHeight = 1,
  }) {
    final height = lineHeight / (fontSize ?? 1);
    return TextStyle(
      fontFamily: AppConstants.appFont,
      fontSize: (fontSize ?? 20).toFS(),
      fontWeight: fontWeight,
      color: color ?? AppColors.title,
      height: height,
    );
  }

  static TextStyle caption = withStyle(
    fontSize: 12,
    lineHeight: 14.4,
    fontWeight: FontWeight.w400,
    color: AppColors.caption,
  );

  static TextStyle header = withStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    lineHeight: 38.4,
  );
  static TextStyle title = withStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    lineHeight: 24.2,
  );

  static TextStyle subtitle = withStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitle,
    lineHeight: 32,
  );

  static TextStyle buttonText = withStyle(
    fontSize: 16,
    lineHeight: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
}
