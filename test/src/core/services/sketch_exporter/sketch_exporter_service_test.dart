import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuwa/src/core/services/sketch_exporter/sketch_exporter_service.dart';

import '../../../../mocks/mock_permissions_handler_service.dart';

void main() {
  late SketchExporterService sketchExporterService;
  late MockPermissionsHandlerService mockPermissionsHandlerService;

  setUp(() {
    mockPermissionsHandlerService = MockPermissionsHandlerService();
    sketchExporterService = SketchExporterService(
      mockPermissionsHandlerService,
    );
  });

  group('SketchExporterService', () {
    test('should not export if permission is denied', () async {
      when(() => mockPermissionsHandlerService.request())
          .thenAnswer((_) async => false);

      await sketchExporterService.exportSketch([Offset(10, 20)]);
      verify(() => mockPermissionsHandlerService.request()).called(1);
    });

    test('should export sketch as a PDF when permission is granted', () async {
      when(() => mockPermissionsHandlerService.request())
          .thenAnswer((_) async => true);

      await sketchExporterService.exportSketch([Offset(10, 20)]);
      verify(() => mockPermissionsHandlerService.request()).called(1);
    });
  });
}
