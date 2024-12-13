part of 'imports_data_collection.dart';

class DataCollectionPage extends StatefulWidget {
  const DataCollectionPage({super.key});

  @override
  State<DataCollectionPage> createState() => _DataCollectionPageState();
}

class _DataCollectionPageState extends State<DataCollectionPage> {
  late final DataCollectionController _controller;

  @override
  void initState() {
    _controller = getIt<DataCollectionController>();
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.main(),
      body: DataCollectionBody(
        onRefresh: _controller.refresh,
        onExport: _controller.exportAsPDF,
        onCoordinatesRecord: _controller.recordCoordinates,
        sketchPointsCubit: _controller.sketchPointsCubit,
        textExperimentCubit: _controller.textExperimentCubit,
      ),
    );
  }
}
