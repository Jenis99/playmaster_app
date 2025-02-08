import 'package:playmaster_ui/dependency.dart';

class GradientProgressBar extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final LinearGradient? gradient;
  final Color? backgroundColor;

  const GradientProgressBar({required this.percent, this.gradient, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: percent,
          fit: FlexFit.tight,
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient ?? LinearGradient(colors: AppColors.gameTextGradientClr),
              // borderRadius: percent == 100
              //     ? const BorderRadius.all(Radius.circular(4))
              //     : const BorderRadius.only(bottomLeft: Radius.circular(4), topLeft: Radius.circular(4)),
            ),
            child: const SizedBox(height: 5.0),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 100 - percent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.grey800Color,
              borderRadius: percent == 0
                  ? const BorderRadius.all(Radius.circular(4))
                  : const BorderRadius.only(bottomRight: Radius.circular(4), topRight: Radius.circular(4)),
            ),
            child: const SizedBox(height: 5.0),
          ),
        ),
      ],
    );
  }
}
