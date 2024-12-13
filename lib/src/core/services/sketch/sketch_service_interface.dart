import 'dart:ui';

abstract class ISketchService {
  List<Offset> recordPoint(double x, double y, {bool isEnd});
  void clearSketch();
}
