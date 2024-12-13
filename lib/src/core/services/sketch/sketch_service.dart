import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'sketch_service_interface.dart';

@LazySingleton(as: ISketchService)
class SketchService implements ISketchService {
  final List<Offset> _sketchPoints = [];

  @override
  List<Offset> recordPoint(double x, double y, {bool isEnd = false}) {
    if (isEnd) {
      _sketchPoints.add(Offset.zero);
    } else {
      _sketchPoints.add(Offset(x, y));
    }
    return List.from(_sketchPoints);
  }

  @override
  void clearSketch() {
    _sketchPoints.clear();
  }
}
