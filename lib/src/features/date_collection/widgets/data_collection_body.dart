part of 'imports_widgets_data_collection.dart';

class DataCollectionBody extends StatelessWidget {
  const DataCollectionBody({
    super.key,
    required this.onRefresh,
    required this.textExperimentCubit,
    required this.onExport,
    required this.onCoordinatesRecord,
    required this.sketchPointsCubit,
  });
  final void Function() onRefresh;
  final GenericBloc<String> textExperimentCubit;
  final Function() onExport;
  final Function(double, double, {bool isEnd}) onCoordinatesRecord;
  final GenericBloc<List<Offset>> sketchPointsCubit;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context) => _DataCollectionMobile(
        key: key,
        onRefresh: onRefresh,
        textExperimentCubit: textExperimentCubit,
        sketchPointsCubit: sketchPointsCubit,
        onCoordinatesRecord: onCoordinatesRecord,
        onExport: onExport,
      ),
      tablet: (context) => _DataCollectionTablet(
        key: key,
        onRefresh: onRefresh,
        textExperimentCubit: textExperimentCubit,
        sketchPointsCubit: sketchPointsCubit,
        onCoordinatesRecord: onCoordinatesRecord,
        onExport: onExport,
      ),
    );
  }
}

class _DataCollectionMobile extends StatelessWidget {
  const _DataCollectionMobile({
    super.key,
    required this.onRefresh,
    required this.textExperimentCubit,
    required this.onExport,
    required this.onCoordinatesRecord,
    required this.sketchPointsCubit,
  });
  final void Function() onRefresh;
  final GenericBloc<String> textExperimentCubit;
  final Function() onExport;
  final Function(double, double, {bool isEnd}) onCoordinatesRecord;
  final GenericBloc<List<Offset>> sketchPointsCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.toW()) +
                EdgeInsets.only(bottom: 32.toH()),
            child: Column(
              children: [
                DataCollectionTextExperimentCard(
                  onRefresh: onRefresh,
                  textExperimentCubit: textExperimentCubit,
                ),
                Expanded(
                  child: DataCollectionSketchAreaCard(
                    sketchPointsCubit: sketchPointsCubit,
                    onCoordinatesRecord: onCoordinatesRecord,
                    onExport: onExport,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DataCollectionTablet extends StatelessWidget {
  const _DataCollectionTablet({
    super.key,
    required this.onRefresh,
    required this.textExperimentCubit,
    required this.onExport,
    required this.onCoordinatesRecord,
    required this.sketchPointsCubit,
  });
  final void Function() onRefresh;
  final GenericBloc<String> textExperimentCubit;
  final Function() onExport;
  final Function(double, double, {bool isEnd}) onCoordinatesRecord;
  final GenericBloc<List<Offset>> sketchPointsCubit;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const DataCollectionHeader()),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 32.toW()) +
              EdgeInsets.only(bottom: 32.toH()),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                DataCollectionTextExperimentCard(
                  onRefresh: onRefresh,
                  textExperimentCubit: textExperimentCubit,
                ),
                DataCollectionSketchAreaCard(
                  sketchPointsCubit: sketchPointsCubit,
                  onCoordinatesRecord: onCoordinatesRecord,
                  onExport: onExport,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
