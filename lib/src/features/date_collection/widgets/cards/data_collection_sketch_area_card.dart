part of '../imports_widgets_data_collection.dart';

class DataCollectionSketchAreaCard extends StatelessWidget {
  final Function() onExport;
  final Function(double, double, {bool isEnd}) onCoordinatesRecord;
  final GenericBloc<List<Offset>> sketchPointsCubit;

  const DataCollectionSketchAreaCard({
    super.key,
    required this.onExport,
    required this.onCoordinatesRecord,
    required this.sketchPointsCubit,
  });

  @override
  Widget build(BuildContext context) {
    return DataSectionCard(
      title: 'Sketch Area',
      actionTitle: 'Export PDF',
      actionIcon: AppIcons.download,
      onActionPressed: onExport,
      child: CardPlain(
        size: Size(double.infinity, 346.toH()),
        borderColor: AppColors.primary,
        child: Stack(
          children: [
            GenerousValueBuilder<List<Offset>>(
              value: sketchPointsCubit,
              builder: (points) {
                return CustomPaint(
                  painter: SketchPainter(points ?? []),
                );
              },
            ),
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  onCoordinatesRecord(
                    details.localPosition.dx,
                    details.localPosition.dy,
                  );
                },
                onPanEnd: (_) {
                  onCoordinatesRecord(0, 0, isEnd: true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
