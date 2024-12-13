import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/styles/app_styles.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          color: AppColors.background,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.title),
        ),
        textTheme:
            Typography.englishLike2018.apply(fontSizeFactor: 1.toFS()).copyWith(
                  // Typography.englishLike2018.apply().copyWith(
                  bodyMedium: AppStyles.withStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.buttonDisabled,
            textStyle: AppStyles.withStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        brightness: Brightness.light,
      );
}
