part of 'imports_widgets_data_collection.dart';

class DataCollectionHeader extends StatelessWidget {
  const DataCollectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardPlain(
      padding: EdgeInsets.symmetric(
        vertical: 27.5.toH(),
        horizontal: 32.toW(),
      ),
      child: Row(
        children: [
          DataCollectionHeaderText(key: key),
          Spacer(),
          DataCollectionHeaderStatus(key: key),
        ],
      ),
    );
  }
}
