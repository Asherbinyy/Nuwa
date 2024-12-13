import 'dart:io' show File, Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nuwa/src/core/logger/app_logger.dart';
import 'package:nuwa/src/core/services/permissions_handler_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'sketch_exporter_service_interface.dart';

@LazySingleton(as: ISketchExporterService)
class SketchExporterService implements ISketchExporterService {
  final IPermissionHandler permissionsHandlerService;

  SketchExporterService(this.permissionsHandlerService);
  @override
  Future<void> exportSketch(List<Offset> points) async {
    try {
      if (!await permissionsHandlerService.request()) return;

      final pdf = _generatePdf(points);

      await _saveOrSharePdf(pdf);
    } catch (e) {
      logger.error("Error while exporting sketch: $e");
    }
  }

  pw.Document _generatePdf(List<Offset> points) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => _convertPointsToPdfWidgets(points),
      ),
    );
    return pdf;
  }

  pw.Widget _convertPointsToPdfWidgets(List<Offset> points) {
    final List<pw.Widget> widgets = [];
    final paint = PdfColor.fromInt(0xFF000000);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        widgets.add(
          pw.Positioned(
            top: points[i].dy,
            left: points[i].dx,
            child: pw.Container(
              height: 1,
              width: 1,
              decoration: pw.BoxDecoration(color: paint),
            ),
          ),
        );
      }
    }

    return pw.Container(
      child: pw.Stack(
        children: widgets,
      ),
    );
  }

  Future<void> _saveOrSharePdf(pw.Document pdf) async {
    final pdfBytes = await pdf.save();

    if (kIsWeb || Platform.isLinux || Platform.isMacOS) {
      await _sharePdf(pdfBytes);
    } else {
      final filePath = await _savePdfToLocalStorage(pdfBytes);
      logger("Exported to: $filePath");

      await _sharePdf(pdfBytes);
    }
  }

  Future<void> _sharePdf(Uint8List pdfBytes) async {
    await Printing.sharePdf(bytes: pdfBytes, filename: 'sketch.pdf');
  }

  Future<String> _savePdfToLocalStorage(Uint8List pdfBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath =
        '${directory.path}/sketch_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File(filePath);

    await file.writeAsBytes(pdfBytes);
    return filePath;
  }
}
