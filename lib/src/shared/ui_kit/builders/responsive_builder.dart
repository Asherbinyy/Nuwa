import 'package:flutter/material.dart';

import '../../../core/resources/constants/app_constants.dart';

typedef ResponsiveBuilderWidget = Widget Function(BuildContext context);

/// Builds a widget based on the size constraints i.e., mobile, tablet, desktop, or custom.
class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveBuilderWidget mobile;
  final ResponsiveBuilderWidget? tablet;
  final ResponsiveBuilderWidget? desktop;
  final ResponsiveBuilderWidget? custom;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final double customBreakpoint;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.custom,
    this.tabletBreakpoint = kTabletBreakpoint,
    this.desktopBreakpoint = kDesktopBreakpoint,
    this.customBreakpoint = kCustomBreakpoint,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        if (width < tabletBreakpoint) {
          return mobile(context);
        } else if (width < desktopBreakpoint) {
          return tablet?.call(context) ?? mobile(context);
        } else if (width < customBreakpoint) {
          return desktop?.call(context) ??
              tablet?.call(context) ??
              mobile(context);
        } else {
          return custom?.call(context) ??
              desktop?.call(context) ??
              tablet?.call(context) ??
              mobile(context);
        }
      },
    );
  }
}
