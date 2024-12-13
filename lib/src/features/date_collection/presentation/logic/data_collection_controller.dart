import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nuwa/src/core/logger/app_logger.dart';
import 'package:nuwa/src/core/navigator/navigator.dart';
import 'package:nuwa/src/core/services/stylus/enum/stylus_state.dart';
import 'package:nuwa/src/core/services/word_generator/word_generator_interface.dart';

import '../../../../core/services/sketch/sketch_service_interface.dart';
import '../../../../core/services/sketch_exporter/sketch_exporter_service_interface.dart';
import '../../../../core/services/stylus/stylus_connection_interface.dart';
import '../../../../shared/generics/generics.dart';

@injectable
class DataCollectionController {
  final ISketchService _sketchService;
  final IWordGenerator _wordGenerator;
  final ISketchExporterService _sketchExporterService;
  final IStylusConnection _stylusConnection;

  final GenericBloc<String> textExperimentCubit;
  final GenericBloc<List<Offset>> sketchPointsCubit;

  DataCollectionController(
    this._sketchService,
    this._wordGenerator,
    this._sketchExporterService,
    this._stylusConnection,
  )   : textExperimentCubit = GenericBloc(_wordGenerator.generate()),
        sketchPointsCubit = GenericBloc([]);

  void init() {
    _stylusConnection.state.addListener(
      () {
        if (_stylusConnection.state.value == StylusState.notConnected) {
          Go.back();
        }
      },
    );
  }

  void refresh() {
    textExperimentCubit.update(data: _wordGenerator.generate());
    sketchPointsCubit.update(data: []);
    _sketchService.clearSketch();
  }

  void recordCoordinates(double x, double y, {bool isEnd = false}) {
    final newPoints = _sketchService.recordPoint(x, y, isEnd: isEnd);
    sketchPointsCubit.update(data: newPoints);
  }

  Future<void> exportAsPDF() async {
    try {
      await _sketchExporterService.exportSketch(sketchPointsCubit.state.data!);
    } catch (e) {
      logger('Export failed: $e');
    }
  }

  /// Disposes resources if needed
  void dispose() {
    textExperimentCubit.update(data: null);
    sketchPointsCubit.update(data: []);
  }
}
