import 'package:xpressfly_app/dependency.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final bool? softWrap;
  final bool isVoidOverflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.softWrap,
    this.height,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.decoration,
    this.isVoidOverflow = false,
    this.fontStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // isVoidOverflow ? text : Characters(text).toList().join('\u{200B}'),
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: textStyle ??
          TextStyle(
            fontFamily: fontFamily ?? AppConstants.poppinsFont,
            color: color ?? AppColors.whiteColor,
            fontStyle: fontStyle,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: fontSize,
            // height: height,
            // letterSpacing: letterSpacing ?? 0.0,
            // wordSpacing: wordSpacing,
            // overflow: overflow,
            // decoration: decoration,
          ),
    );
  }
}
