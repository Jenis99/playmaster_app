import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/last_minute_game_model.dart';

class LastMinuteGameCard extends StatelessWidget {
  const LastMinuteGameCard({super.key, required this.lastMinGameModel});

  final LastMinGameModel lastMinGameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.pushNamed(AppRoutes.gameDetailScreen, arg: lastMinGameModel.gameName ?? "");

        // Navigation.push(GameDetailScreen(
        //   gameTitle: lastMinGameModel.gameName ?? "",
        // ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        decoration: BoxDecoration(color: AppColors.grey900Color2, borderRadius: BorderRadius.circular(4.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Game image
            CachedNetworkImg(
              imgPath: lastMinGameModel.gameImg ??
                  "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
              // imgWidth: 140.w,
              imgHeight: 140.h,
              borderRadius: 4.r,
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
