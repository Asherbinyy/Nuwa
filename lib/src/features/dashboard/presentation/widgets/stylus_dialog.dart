part of 'imports_widgets_dashboard.dart';

class StylusDialog extends StatelessWidget {
  final GenericBloc<StylusState> state;
  final VoidCallback? onAction;

  const StylusDialog({
    super.key,
    required this.state,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return GenerousValueBuilder<StylusState>(
      value: state,
      builder: (newValue) {
        final value = newValue ?? StylusState.notConnected;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconWidget(
              icon: AppIcons.pen,
              backgroundColor: value.iconBackgroundColor,
              child: value == StylusState.connecting ? AppLoader() : null,
            ),
            40.SH(),
            AppText(
              value.title,
              style: AppStyles.header,
              textAlign: TextAlign.center,
            ),
            20.SH(),
            AppText(
              value.message,
              style: AppStyles.subtitle,
              textAlign: TextAlign.center,
            ),
            40.SH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPrimary(
                  // width: 264,
                  onPressed: value == StylusState.connecting ? null : onAction,
                  title: value.buttonTitle,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
