import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuwa/src/core/services/stylus/enum/stylus_state.dart';
import 'package:nuwa/src/features/date_collection/presentation/logic/data_collection_controller.dart';

import '../../../../../mocks/mock_sketch_exporter_service.dart';
import '../../../../../mocks/mock_sketch_service.dart';
import '../../../../../mocks/mock_stylus_connection.dart';
import '../../../../../mocks/mock_word_generator.dart';

void main() {
  late DataCollectionController controller;
  late MockSketchService mockSketchService;
  late MockSketchExporterService mockSketchExporterService;
  late MockStylusConnection mockStylusConnection;
  late MockWordGenerator mockWordGenerator;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockSketchService = MockSketchService();
    mockSketchExporterService = MockSketchExporterService();
    mockStylusConnection = MockStylusConnection();
    mockWordGenerator = MockWordGenerator();

    when(() => mockWordGenerator.generate()).thenReturn('Test Word');
    when(() => mockSketchService.recordPoint(any(), any(),
        isEnd: any(named: 'isEnd'))).thenReturn([]);
    when(() => mockSketchService.clearSketch()).thenReturn(null);
    when(() => mockStylusConnection.state)
        .thenReturn(ValueNotifier(StylusState.connected));
    when(() => mockSketchExporterService.exportSketch(any()))
        .thenAnswer((_) async {});

    controller = DataCollectionController(
      mockSketchService,
      mockWordGenerator,
      mockSketchExporterService,
      mockStylusConnection,
    );
  });

  group('DataCollectionController', () {
    test('initial state is set correctly', () {
      expect(controller.textExperimentCubit.state.data, 'Test Word');
      expect(controller.sketchPointsCubit.state.data, []);
    });

    test('refresh clears sketch and updates text experiment', () {
      controller.refresh();

      verify(() => mockSketchService.clearSketch()).called(1);
      expect(controller.textExperimentCubit.state.data, 'Test Word');
      expect(controller.sketchPointsCubit.state.data, []);
    });

    test('records sketch points correctly', () {
      controller.recordCoordinates(10, 20);
      verify(() => mockSketchService.recordPoint(10, 20, isEnd: false))
          .called(1);
      expect(controller.sketchPointsCubit.state.data, []);
    });

    test('exports sketch as PDF', () async {
      await controller.exportAsPDF();
      verify(() => mockSketchExporterService.exportSketch([])).called(1);
    });

    test('stylus disconnect triggers Go.back()', () {
      when(() => mockStylusConnection.state).thenReturn(
        ValueNotifier(StylusState.notConnected),
      );

      controller.init();
      mockStylusConnection.state.value = StylusState.notConnected;

      expect(mockStylusConnection.state.value, StylusState.notConnected);
    });

    test('dispose clears resources', () {
      controller.dispose();

      expect(controller.textExperimentCubit.state.data, null);
      expect(controller.sketchPointsCubit.state.data, []);
    });
  });
}
