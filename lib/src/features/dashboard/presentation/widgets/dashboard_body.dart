part of 'imports_widgets_dashboard.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 32.toW() : 297.toW(),
          vertical: context.isMobile ? 24.toH() : 80.toH(),
        ),
        child: CardPlain(
          padding: EdgeInsets.all(40.0.toRad()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppImages.dashboard,
              ),
              32.SH(),
              AppText(
                'Data Collection and Testing Tool',
                style: AppStyles.header,
                textAlign: TextAlign.center,
              ),
              32.SH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonPrimary(
                    title: 'Data Collection',
                    onPressed: onPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
