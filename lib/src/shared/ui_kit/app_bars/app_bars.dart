import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/styles/app_colors.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';
import 'package:nuwa/src/shared/ui_kit/logo_widget.dart';

class AppBars {
  static AppBar main() {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black,
      toolbarHeight: 80.toH(),
      titleSpacing: 32.toH(),
      title: Hero(
        tag: 'logo',
        child: LogoWidget(),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 32.toH()),
          child: Icon(
            Icons.menu,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
