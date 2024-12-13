import 'package:flutter_test/flutter_test.dart';
import 'package:nuwa/src/core/services/sketch/sketch_service.dart';

void main() {
  late SketchService sketchService;

  setUp(() {
    sketchService = SketchService();
  });

  group('SketchService', () {
    test('should record points correctly', () {
      final points = sketchService.recordPoint(10, 20);
      expect(points, [Offset(10, 20)]);

      final updatedPoints = sketchService.recordPoint(30, 40);
      expect(updatedPoints, [Offset(10, 20), Offset(30, 40)]);
    });

    test('should add zero offset when isEnd is true', () {
      sketchService.recordPoint(10, 20);
      final points = sketchService.recordPoint(0, 0, isEnd: true);
      expect(points, [Offset(10, 20), Offset.zero]);
    });

    test('should clear points correctly', () {
      sketchService.recordPoint(10, 20);
      sketchService.clearSketch();
      final points = sketchService.recordPoint(30, 40);
      expect(points, [Offset(30, 40)]);
    });
  });
}
