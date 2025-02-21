import 'package:playmaster_ui/dependency.dart';

class TournamentTitle extends StatelessWidget {
  const TournamentTitle({
    super.key,
    required this.title,
    this.onViewAll,
    this.subTitle,
    this.isSingleTitle = false,
    this.titleFontSize,
    this.subtitleFontSize,
    this.titleColor,
    this.subtitleColor,
    this.titleFontWeight,
    this.subtitleFontWeight,
  });

  final String title;
  final String? subTitle;
  final void Function()? onViewAll;
  final bool isSingleTitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final Color? titleColor;
  final Color? subtitleColor;
  final FontWeight? titleFontWeight;
  final FontWeight? subtitleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSingleTitle ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        /// Game title
        AppText(
          text: title,
          fontWeight: titleFontWeight ?? FontWeight.w600,
          fontSize: titleFontSize ?? 18.sp,
          color: titleColor ?? AppColors.whiteColor,
        ),

        /// View all
        !isSingleTitle
            ? GestureDetector(
                onTap: onViewAll,
                child: Container(
                  padding: EdgeInsets.only(left: 10.w),
                  color: AppColors.transparentClr,
                  child: AppText(
                    text: subTitle ?? AppString.viewAll,
                    color: subtitleColor ?? AppColors.blue500Color,
                    fontWeight: subtitleFontWeight ?? FontWeight.w600,
                    fontSize: subtitleFontSize,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
