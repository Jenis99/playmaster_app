import 'package:playmaster_ui/dependency.dart';

class TournamentTitle extends StatelessWidget {
  const TournamentTitle({
    super.key,
    required this.title,
    this.onViewAll,
    this.subTitle,
    this.isSingleTitle = false,
  });

  final String title;
  final String? subTitle;
  final void Function()? onViewAll;
  final bool isSingleTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSingleTitle ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        /// Game title
        AppText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.whiteColor,
        ),

        /// View all
        !isSingleTitle
            ? GestureDetector(
                onTap: onViewAll,
                child: Container(
                  color: AppColors.transparentClr,
                  child: AppText(
                    text: subTitle ?? AppString.viewAll,
                    color: AppColors.blue500Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
