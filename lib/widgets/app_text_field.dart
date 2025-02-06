import 'package:flutter/services.dart';
import 'package:playmaster_ui/dependency.dart';

class AppTextField extends StatefulWidget {
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
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    // Color grayColor900 = AppColors.grayColor.shade900;
    // Color grayColor500 = AppColors.grayColor.shade500;
    return Obx(
      () => TextField(
        controller: widget.controller,
        obscureText: widget.isVisibility.value,
        readOnly: widget.readOnly,
        maxLines: widget.obscureText == true ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        // cursorColor: AppColors.primaryColor,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        onSubmitted: widget.onSubmitted,
        // expands: true,
        style: TextStyle(
          fontSize: widget.fontSize ?? 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.0,
          fontFamily: AppString.montserratFont,
          // color: grayColor900,
        ),
        textAlign: widget.textAlign ?? TextAlign.start,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          counterText: '',
          fillColor: widget.color ?? AppColors.grey800Color,
          filled: true,
          hintText: widget.hintText ?? '',
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(14),
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: AppColors.grey900Color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                // letterSpacing: 0.0,
              ),
          focusedBorder: CustomStyle.commonBorder(color: AppColors.grey900Color),
          enabledBorder: CustomStyle.commonBorder(color: AppColors.grey900Color),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(widget.prefixIconPadding ?? 15.w),
                  child: widget.prefixIcon,
                )
              : null,
          suffixIcon: buildDefaultSuffix(),
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    ).paddingOnly(bottom: 32.h);
  }

  Widget? buildDefaultSuffix() {
    return widget.suffixIcon ??
        (widget.obscureText ?? false
            ? GestureDetector(
                onTap: () {
                  widget.isVisibility.value = !widget.isVisibility.value;
                },
                child: Icon(
                  widget.isVisibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: !widget.isVisibility.value ? AppColors.grey900Color : AppColors.mediumGreyColor,
                  size: 23,
                ),
              )
            : null);
  }
}
