part of 'imports_buttons.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final bool isDisabled;

  const ButtonPrimary({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled || onPressed == null;
    return ElevatedButton(
      onPressed: onPressed,
      style: _style(
        isButtonDisabled ? AppColors.buttonDisabled : color,
        borderRadius,
      ),
      child: Center(
        child: AppText(
          title,
          style: AppStyles.buttonText.copyWith(
            color: isButtonDisabled ? AppColors.white : AppColors.title,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  ButtonStyle _style(
    Color? color,
    double? borderRadius,
  ) {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 16.toH(),
        horizontal: 58.toW(),
      ),
      fixedSize: Size((width ?? 265).toW(), (height ?? 56).toH()),
      backgroundColor: color ?? AppColors.primary,
      foregroundColor: AppColors.buttonDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 100.toRad()),
      ),
    );
  }
}
