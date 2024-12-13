import 'package:flutter/material.dart';
import 'package:nuwa/src/core/navigator/navigator.dart';
import 'package:nuwa/src/core/resources/styles/app_colors.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

import '../animations/fade_transition_wrapper.dart';

class AppDialogs {
  AppDialogs._();

  static bool _isDialogOpen = false;

  static bool get isDialogOpen => _isDialogOpen;

  static Future<void> show({
    required Widget child,
  }) async {
    if (_isDialogOpen) return;

    _isDialogOpen = true;
    await showDialog(
      context: Go.context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.white,
          child: FadeTransitionWrapper(
            child: Padding(
              padding: EdgeInsets.all(60.toRad()),
              child: SizedBox(
                width: 600.toW(),
                child: child,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogOpen = false;
    });
  }
}
