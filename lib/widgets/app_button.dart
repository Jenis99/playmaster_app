import 'package:xpressfly_app/dependency.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final bool isTransparentButton;
  final bool isBorderButton;
  final bool isLoading;
  final Widget? icon;
  final double? iconRightPadding;
  final EdgeInsetsGeometry? buttonMargin;

  const AppButton({
    super.key,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textColor,
    this.buttonColor,
    this.onTap,
    this.height,
    this.width,
    this.isTransparentButton = false,
    this.isBorderButton = false,
    this.isLoading = false,
    this.icon,
    this.iconRightPadding,
    this.buttonMargin,
  });

  @override
  Widget build(BuildContext context) {
    bool isBorderOrTransparentBtn = isTransparentButton || isBorderButton;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60.h,
        margin: buttonMargin,
        clipBehavior: Clip.antiAlias,
        decoration: CustomStyle.buttonShapeDecoration(
          color: buttonColor ?? AppColors.primaryColor,
          isBorder: isBorderButton,
          isTransparent: isTransparentButton,
          borderWidth: 1,
        ),
        child: Center(
          child: icon != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    SizedBox(
                      width: iconRightPadding ?? 8.w,
                    ),
                    textView(isBorderOrTransparentBtn)
                  ],
                )
              : textView(isBorderOrTransparentBtn),
        ),
      ),
    );
  }

  Widget textView(bool isBorderOrTransparentBtn) {
    return AppText(
      text: text,
      color: textColor ?? AppColors.whiteColor,
      fontSize: fontSize ?? 20.sp,
      fontFamily: fontFamily ?? AppConstants.poppinsFont,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }
}
