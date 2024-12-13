import 'package:flutter/material.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.icon,
    this.child,
    required this.backgroundColor,
    this.color,
  });
  final String? icon;
  final Color backgroundColor;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100.toRad(),
      backgroundColor: backgroundColor,
      child: child ??
          Image.asset(
            icon!,
            width: 44.toRad(),
            height: 44.toRad(),
            color: color,
          ),
    );
  }
}
