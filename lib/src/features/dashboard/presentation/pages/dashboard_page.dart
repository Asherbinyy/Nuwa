part of 'imports_dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = getIt.get<DashboardController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBars.main(),
      body: Column(
        children: [
          DashboardBody(onPressed: controller.onDataCollectionPressed),
          CopyRightsTextBuilder(),
        ],
      ),
    );
  }
}
