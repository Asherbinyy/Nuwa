part of 'imports_widgets_data_collection.dart';

class DataCollectionHeaderText extends StatelessWidget {
  const DataCollectionHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      'Data Collection : Using stylus',
      style: AppStyles.withStyle(
        lineHeight: 28.8,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.start,
    );
  }
}
