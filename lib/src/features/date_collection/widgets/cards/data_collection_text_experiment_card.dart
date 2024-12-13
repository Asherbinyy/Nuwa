part of '../imports_widgets_data_collection.dart';

class DataCollectionTextExperimentCard extends StatelessWidget {
  const DataCollectionTextExperimentCard({
    super.key,
    required this.onRefresh,
    required this.textExperimentCubit,
  });

  final void Function() onRefresh;
  final GenericBloc<String> textExperimentCubit;

  @override
  Widget build(BuildContext context) {
    return DataSectionCard(
      title: 'Text Experiment',
      actionTitle: 'Refresh',
      actionIcon: AppIcons.refresh,
      onActionPressed: onRefresh,
      child: CardPlain(
        padding: EdgeInsets.symmetric(
          horizontal: 24.toW(),
          vertical: 43.toH(),
        ),
        child: GenerousValueBuilder<String>(
          value: textExperimentCubit,
          builder: (text) {
            return Center(
              child: AppText(
                text ?? '',
                style: AppStyles.header,
              ),
            );
          },
        ),
      ),
    );
  }
}
