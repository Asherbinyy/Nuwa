import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/styles/app_colors.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

class CardPlain extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Size? size;
  final Color? borderColor;
  const CardPlain({
    super.key,
    required this.child,
    this.size,
    this.borderColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.height,
      width: size?.width,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: borderColor == null
            ? null
            : Border.all(width: 1.toW(), color: borderColor!),
        boxShadow: borderColor != null
            ? []
            : [
                BoxShadow(
                  color: AppColors.cardShadow.withOpacity(0.25),
                  offset: const Offset(0, 1),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: child,
    );
  }
}
