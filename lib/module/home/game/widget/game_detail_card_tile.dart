import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/last_minute_game_model.dart';
import 'package:playmaster_ui/module/home/home.dart';

class GameDetailCardTile extends StatelessWidget {
  const GameDetailCardTile({super.key, required this.lastMinGameModel, this.isFromTournament = false, this.isFromPayment = false});

  final LastMinGameModel lastMinGameModel;
  final bool isFromTournament;
  final bool isFromPayment;

  @override
  Widget build(BuildContext context) {
    print("GameDetailCardTile called ${lastMinGameModel.tournamentStatus?.name}");
    return GestureDetector(
      onTap: () {
        Get.to<dynamic>(() => TournamentDetailScreen(lastMinGameModel: lastMinGameModel), transition: Transition.rightToLeft);
      },
      child: Container(
        padding: EdgeInsets.all(isFromTournament ? 0 : 12.h),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: isFromTournament ? 0 : 16.h),
        decoration: BoxDecoration(
            color: isFromTournament ? AppColors.transparentClr : AppColors.grey900Color2,
            borderRadius: BorderRadius.circular(AppConstants.commonRadius)),
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
            16.h.verticalSpace,

            /// Start time
            Row(
              mainAxisAlignment: isFromTournament ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
              children: [
                AppText(
                  text: lastMinGameModel.startTime ?? "Start at 12 Jun, 10:00pm",
                  fontSize: isFromTournament ? 14.sp : 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey400Color,
                ),
                if (isFromTournament)
                  GameTypeView(
                    gameType: lastMinGameModel.gameType ?? GameType.pcGame,
                    iconSize: 16.h,
                  )
              ],
            ),
            16.h.verticalSpace,

            /// Tournament status view
            if (isFromPayment) tournamentStatusView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Entry fee
                AppText(
                  text: "₹${lastMinGameModel.pricePerTeam ?? 500} entry fee",
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
      ),
    );
  }

  Widget tournamentStatusView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      margin: EdgeInsets.only(top: 14.h, bottom: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: statusWiseColor(),
      ),
      child: AppText(
        text: lastMinGameModel.tournamentStatus?.statusLabel ?? "",
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      ),
    );
  }

  Color statusWiseColor() => lastMinGameModel.tournamentStatus == TournamentStatus.joined
      ? AppColors.green400Clr
      : lastMinGameModel.tournamentStatus == TournamentStatus.live
          ? AppColors.primaryColor
          : AppColors.grey800Color;
}
