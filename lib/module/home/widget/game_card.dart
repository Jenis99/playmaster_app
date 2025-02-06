import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/game_model.dart';
import 'package:playmaster_ui/widgets/dotted_divider.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.gameModel});

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.h,
      decoration: BoxDecoration(color: AppColors.grey900Color2, borderRadius: BorderRadius.circular(4.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Game image
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              gameModel.gameImg ?? "Game Image",
              width: 293.w,
              height: 140.h,
            ),
          ),
          16.h.verticalSpace,

          /// Game title
          AppText(
            text: gameModel.gameName ?? "Game Name",
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
            fontSize: 16.sp,
          ).paddingSymmetric(
            horizontal: 12.w,
          ),

          /// Price pool
          AppText(
            text: gameModel.prizePool ?? "Prize Pool",
            fontWeight: FontWeight.w500,
            color: AppColors.greenClr,
            fontSize: 14.sp,
          ).paddingSymmetric(horizontal: 12.w, vertical: 16.h),

          /// Dotted divider
          MySeparator(color: AppColors.grey700Color),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Entry fee
              AppText(
                text: gameModel.gameFee ?? "Game Fee",
                fontWeight: FontWeight.w500,
                color: AppColors.grey300Color,
                fontSize: 12.sp,
              ).paddingOnly(right: 10.h),

              /// Game start time
              AppText(
                fontSize: 12.sp,
                maxLines: 1,
                fontWeight: FontWeight.w500,
                color: AppColors.grey500Color,
                text: "Start at 12 Jun, 10:00pm",
              ),
            ],
          ).paddingAll(12.h),
        ],
      ),
    );
  }
}
