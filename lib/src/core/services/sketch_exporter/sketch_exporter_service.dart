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

      final pdf = await compute(_generatePdfInBackground, points);

      await _saveOrSharePdf(pdf);
    } catch (e) {
      logger.error("Error while exporting sketch: $e");
    }
  }

  /// Generate the PDF in a background thread
  static pw.Document _generatePdfInBackground(List<Offset> points) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => _convertPointsToPdfWidgets(points),
      ),
    );
    return pdf;
  }

  /// Convert points into PDF widgets
  static pw.Widget _convertPointsToPdfWidgets(List<Offset> points) {
    return pw.CustomPaint(
      size: const PdfPoint(500, 500),
      painter: (PdfGraphics canvas, PdfPoint size) {
        final paint = PdfColor.fromInt(0xFF000000);

        if (kIsWeb) {
          canvas.setTransform(
            Matrix4.identity()
              ..scale(1, -1, 1)
              ..translate(0, -size.y),
          );
        }

        for (int i = 0; i < points.length - 1; i++) {
          if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
            canvas
              ..setStrokeColor(paint)
              ..setLineWidth(1)
              ..moveTo(points[i].dx, points[i].dy)
              ..lineTo(points[i + 1].dx, points[i + 1].dy)
              ..strokePath();
          }
        }
      },
    );
  }

  /// Save or share the PDF
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

  /// Share the PDF
  Future<void> _sharePdf(Uint8List pdfBytes) async {
    await Printing.sharePdf(bytes: pdfBytes, filename: 'sketch.pdf');
  }

  /// Save PDF to local storage (for mobile)
  Future<String> _savePdfToLocalStorage(Uint8List pdfBytes) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/sketch_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File(filePath);

      await file.writeAsBytes(pdfBytes);
      return filePath;
    } catch (e) {
      logger.error('Error while saving file: $e');
      rethrow;
    }
  }
}
