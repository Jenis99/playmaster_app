import 'package:playmaster_ui/dependency.dart';

class CustomStyle {
  static ShapeDecoration buttonShapeDecoration(
      {Color? color,
      Color? shadowColor,
      bool isBorder = false,
      bool isTransparent = false,
      bool isGradient = true,
      double? radius,
      double? borderWidth,
      Color? borderColor,
      bool isBoxShadows = false}) {
    return ShapeDecoration(
      color: color ?? ((isTransparent || isBorder) ? AppColors.transparentClr : null),
      shape: RoundedRectangleBorder(
        side: isBorder
            ? BorderSide(
                width: borderWidth ?? 2,
                color: borderColor ?? AppColors.grey900Color,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(radius ?? AppConstants.commonRadius),
      ),
      shadows: isBoxShadows || (isGradient && !isTransparent)
          ? [
              BoxShadow(
                color: shadowColor ?? AppColors.grey400Color.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 16,
              )
            ]
          : null,
      gradient: (isGradient && !isTransparent && color == null)
          ? LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.primaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 0.3, 1.0],
            )
          : null,
    );
  }

  // static TextStyle termsOfServiceTextStyle({double? fontSize, Color? color, FontWeight? fontWeight, bool isUnderLine = false}) {
  //   return TextStyle(
  //     color: color ?? AppColors.microsoftEdgeBlue,
  //     fontSize: fontSize ?? 14.sp,
  //     fontFamily: AppString.urbanistFont,
  //     letterSpacing: 0.0,
  //     fontWeight: fontWeight ?? FontWeight.w600,
  //     decoration: isUnderLine ? TextDecoration.underline : null,
  //     decorationColor: isUnderLine ? AppColors.darkPink : null,
  //   );
  // }

  static OutlineInputBorder commonBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.commonRadius),
      borderSide: BorderSide(
        color: color ?? AppColors.grey900Color,
        width: 0.8),
    );
  }
}
