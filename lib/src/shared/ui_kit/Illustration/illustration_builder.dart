import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/styles/app_styles.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';
import 'package:nuwa/src/shared/ui_kit/buttons/imports_buttons.dart';
import 'package:nuwa/src/shared/ui_kit/text/app_text.dart';

class IllustrationBuilder extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  final Widget? button;

  const IllustrationBuilder({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
          color: Colors.grey,
        ),
        const SizedBox(height: 20),
        AppText(
          title,
          style: AppStyles.title,
        ),
        if (subtitle != null) ...[
          10.SH(),
          AppText(
            subtitle!,
          ),
        ],
        if (button != null) ...[
          const SizedBox(height: 20),
          button!,
        ],
      ],
    );
  }

  /// A widget to display an illustration for a fatal error in production mode. and the error details in debug mode.
  static Widget fatalError(FlutterErrorDetails details) {
    return Scaffold(
      body: Visibility(
        visible: kReleaseMode,
        replacement: Column(
          children: [
            AppText(
              details.exception.toString(),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            16.0.SH(),
            AppText(
              details.exceptionAsString(),
              // padding: EdgeInsets.symmetric(horizontal: 30.0.toW()),
              fontSize: 13,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        child: IllustrationBuilder(
          icon: CupertinoIcons.exclamationmark_circle_fill,
          title: details.exception.toString(),
          subtitle: details.exceptionAsString(),
        ),
      ),
    );
  }

  factory IllustrationBuilder.withButton({
    required String title,
    required IconData icon,
    String? subtitle,
    required VoidCallback onRetry,
  }) {
    return IllustrationBuilder(
      title: title,
      icon: icon,
      subtitle: subtitle,
      button: ButtonPrimary(
        title: 'Retry',
        onPressed: onRetry,
      ),
    );
  }
}
