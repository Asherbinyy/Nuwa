part of 'imports_widgets_data_collection.dart';

class DataCollectionHeaderStatus extends StatelessWidget {
  const DataCollectionHeaderStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Your device is now connected',
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.toH(),
          horizontal: 12.toW(),
        ),
        decoration: BoxDecoration(
          color: AppColors.isConnectedBg,
          borderRadius: BorderRadius.circular(16.toRad()),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.pen,
              color: AppColors.isConnected,
              height: 24.toH(),
              width: 24.toH(),
            ),
            SizedBox(width: 6.toW()),
            AppText(
              'Connected',
              style: AppStyles.title.copyWith(
                color: AppColors.isConnected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
