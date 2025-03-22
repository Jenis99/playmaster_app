import 'package:xpressfly_app/dependency.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    this.fontSize,
    this.firstFontWeight,
    this.secondFontWeight,
    required this.firstTitle,
    required this.secondTitle,
    required this.firstTitleColor,
    required this.secondTitleColor,
  });

  final double? fontSize;
  final String firstTitle;
  final String secondTitle;
  final Color firstTitleColor;
  final Color secondTitleColor;
  final FontWeight? firstFontWeight;
  final FontWeight? secondFontWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstTitle,
        style: TextStyle(
          color: firstTitleColor,
          fontSize: fontSize,
          fontWeight: firstFontWeight,
        ),
        children: <TextSpan>[
          TextSpan(
            text: secondTitle,
            style: TextStyle(color: secondTitleColor, fontWeight: secondFontWeight),
          ),
        ],
      ),
    );
  }
}
