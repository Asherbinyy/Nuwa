import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSpacesEx on num {
  /// Sized Box with Width
  // ignore: non_constant_identifier_names
  SizedBox SW() => SizedBox(width: w);

  /// Sized Box with height

  // ignore: non_constant_identifier_names
  SizedBox SH() => SizedBox(height: h);

  /// radius
  double toRad() => (r);

  /// font size
  double toFS() => (sp);

  /// height
  double toH() => (h);

  /// width
  double toW() => (w);
}
