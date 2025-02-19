import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/game/presentation/game_detail_screen.dart';

class LastMinuteGameCard extends StatelessWidget {
  const LastMinuteGameCard({super.key, required this.lastMinGameModel});

  final LastMinGameModel lastMinGameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.rightToLeft(GameDetailScreen(gameTitle: lastMinGameModel.gameName ?? ""));
        // Navigation.push(GameDetailScreen(
        //   gameTitle: lastMinGameModel.gameName ?? "",
        // ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        decoration: BoxDecoration(color: AppColors.grey900Color2, borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Game image
            CachedNetworkImg(
              imgPath: lastMinGameModel.gameImg ??
                  "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
              // imgWidth: 140.w,
              imgHeight: 140.h,
              borderRadius: AppConstants.borderRadius,
              fit: BoxFit.cover,
            ),

            16.h.verticalSpace,

            /// Game title
            AppText(
              text: lastMinGameModel.gameName ?? "Valorant - Unrank Medium Pool",
              maxLines: 2,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
              fontSize: 16.sp,
            ).paddingSymmetric(horizontal: 8.w),

            AppText(
              text: "₹${lastMinGameModel.pricePerTeam ?? 600}/team",
              fontWeight: FontWeight.w500,
              color: AppColors.grey400Color,
              fontSize: 14.sp,
            ).paddingSymmetric(horizontal: 8.w, vertical: 10.h),

            /// Price pool
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImg(
                  imgPath: AppAssets.rupeesCurrencyIcon,
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

            //Progress bar
            GradientProgressBar(percent: lastMinGameModel.slotPercentage ?? 50).paddingSymmetric(horizontal: 8.w),

            AppText(
              maxLines: 1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
              text: "${lastMinGameModel.availableSlot ?? 1}/${lastMinGameModel.totalSlot ?? 2} slot available",
            ).paddingOnly(top: 8.h, right: 8.w, left: 8.w),
          ],
        ),
      ),
    );
  }
}
