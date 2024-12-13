import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/constants/app_constants.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? isSelectable;
  final TextDecoration? decoration;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.isSelectable,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelectable == true) {
      return SelectableText(
        text,
        style: style ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  decoration: decoration,
                  fontFamily: AppConstants.appFont,
                ),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: fontWeight,
                fontSize: fontSize,
                decoration: decoration,
                fontFamily: AppConstants.appFont,
              ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
