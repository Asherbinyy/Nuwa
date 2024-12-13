import 'package:flutter/material.dart';

abstract class ISketchExporterService {
  Future<void> exportSketch(List<Offset> points);
}
