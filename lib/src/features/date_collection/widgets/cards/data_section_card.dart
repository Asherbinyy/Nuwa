part of '../imports_widgets_data_collection.dart';

class DataSectionCard extends StatelessWidget {
  const DataSectionCard({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.actionIcon,
    required this.onActionPressed,
    required this.child,
  });

  final String title;
  final String actionTitle;
  final String actionIcon;
  final void Function() onActionPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.toH()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                title,
                style: AppStyles.title,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.toH(),
                    horizontal: 46.toW(),
                  ),
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.black,
                  shadowColor: const Color(0xFF101828),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.toRad()),
                  ),
                  side: BorderSide(width: 1, color: Color(0xFFEAECEF)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      actionIcon,
                      color: AppColors.icons,
                      width: 20.toRad(),
                      height: 20.toRad(),
                    ),
                    8.SW(),
                    AppText(
                      actionTitle,
                      style: AppStyles.buttonText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.SH(),
          child,
        ],
      ),
    );
  }
}
