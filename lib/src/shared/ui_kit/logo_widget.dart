import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/assets/app_icons.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

class LogoWidget extends StatelessWidget {
  final Size size;
  const LogoWidget({
    super.key,
    this.size = const Size(48, 48),
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppIcons.logo,
      width: size.width.toH(),
      height: size.height.toH(),
    );
  }
}
