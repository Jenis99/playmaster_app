import 'package:flutter/services.dart';
import 'package:xpressfly_app/dependency.dart';

class AppTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final String? hintText;
  final bool? obscureText;
  final bool showBorder;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  late final RxBool isVisibility;
  final Color? color;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? hintStyle;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final double? prefixIconPadding;
  final double? horizontalPadding;
  final ValueChanged<String>? onSubmitted;
  final TextAlign? textAlign;
  final bool isPhoneField;

  AppTextField({
    super.key,
    required this.controller,
    this.obscureText,
    this.onTap,
    this.hintStyle,
    this.prefixIcon,
    this.color,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.width,
    this.fontSize,
    this.height,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.margin,
    this.contentPadding,
    this.showBorder = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textInputAction,
    this.textCapitalization,
    this.focusNode,
    this.prefixIconPadding,
    this.horizontalPadding,
    this.onSubmitted,
    this.textAlign,
    this.isPhoneField = false,
  }) {
    isVisibility = (obscureText ?? false).obs;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        obscureText: isVisibility.value,
        readOnly: readOnly,
        maxLines: obscureText == true ? 1 : maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onSubmitted: onSubmitted,
        style: TextStyle(
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.0,
          fontFamily: AppConstants.poppinsFont,
          // color: grayColor900,
        ),
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction ?? TextInputAction.done,
        focusNode: focusNode,
        decoration: InputDecoration(
          counterText: '',
          fillColor: color ?? AppColors.lightGreyColor,
          filled: true,
          hintText: hintText ?? '',
          contentPadding: contentPadding ?? const EdgeInsets.all(14),
          hintStyle: hintStyle ??
              TextStyle(
                color: AppColors.grey900Color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                // letterSpacing: 0.0,
              ),
          focusedBorder: CustomStyle.commonBorder(color: showBorder ? AppColors.grey900Color : AppColors.transparentClr),
          enabledBorder: CustomStyle.commonBorder(color: showBorder ? AppColors.grey900Color : AppColors.transparentClr),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(prefixIconPadding ?? 15.w),
                  child: prefixIcon,
                )
              : null,
          suffixIcon: buildDefaultSuffix(),
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }

  Widget? buildDefaultSuffix() {
    return suffixIcon ??
        (obscureText ?? false
            ? GestureDetector(
                onTap: () {
                  isVisibility.value = !isVisibility.value;
                },
                child: Icon(
                  isVisibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: !isVisibility.value ? AppColors.grey900Color : AppColors.mediumGreyColor,
                  size: 23,
                ),
              )
            : null);
  }
}
