import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/last_minute_game_model.dart';

class GameDetailCardTile extends StatelessWidget {
  const GameDetailCardTile({super.key, required this.lastMinGameModel});

  final LastMinGameModel lastMinGameModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
      decoration: BoxDecoration(color: AppColors.grey900Color2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Game name
          AppText(
            text: lastMinGameModel.gameName ?? "Valorant - Unrank Medium Pool",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
          ),
          6.h.verticalSpace,

          /// Start time
          AppText(
            text: lastMinGameModel.startTime ?? "Start at 12 Jun, 10:00pm",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grey400Color,
          ),
          16.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Entry fee
              AppText(
                text: "₹${lastMinGameModel.pricePerTeam} entry fee",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              ),

              /// Price pool
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImg(
                    imgPath: AppAssets.rupeesIcon,
                    isAssetImg: true,
                    imgSize: 15.h,
                  ),

                  /// Entry fee
                  AppText(
                    fontSize: 12.sp,
                    color: AppColors.greenClr,
                    fontWeight: FontWeight.w500,
                    text: " ${lastMinGameModel.pricePool ?? 1000} Prize pool",
                  )
                ],
              ).paddingOnly(right: 8.w, left: 8.w, bottom: 10.h),
            ],
          ),
          20.h.verticalSpace,
          GradientProgressBar(percent: lastMinGameModel.slotPercentage ?? 50),

          /// Slot available
          AppText(
            maxLines: 1,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
            text: "${lastMinGameModel.availableSlot ?? 1}/${lastMinGameModel.totalSlot ?? 2} slot available",
          ).paddingOnly(top: 8.h, right: 8.w, left: 8.w),
        ],
      ),
    );
  }
}
