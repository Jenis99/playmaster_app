import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/last_minute_game_model.dart';
import 'package:playmaster_ui/module/home/home.dart';

class MyMatchTile extends StatelessWidget {
  MyMatchTile({Key? key, required this.lastMinGameModel, required this.selectedIndex}) : super(key: key);
  final LastMinGameModel lastMinGameModel;
  final int selectedIndex;

  /// Tabs index
  final int upcomingIndex = 0;
  final int liveIndex = 1;
  final int completedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToDetail,
      child: Container(
        decoration: BoxDecoration(color: AppColors.grey900Color2, borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListTile(
                onTap: navigateToDetail,
                // tileColor: Colors.red,
                contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h),
                minTileHeight: 60.h,
                leading: CachedNetworkImg(
                  imgPath: lastMinGameModel.gameImg ??
                      "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
                  borderRadius: AppConstants.borderRadius,
                  imgSize: 40.h,
                  fit: BoxFit.cover,
                ),
                title: AppText(text: lastMinGameModel.gameName ?? AppString.valorantTag),
                titleTextStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                subtitleTextStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.grey400Color),
                subtitle:
                    AppText(text: lastMinGameModel.gameFee ?? "", fontWeight: FontWeight.w500, color: AppColors.grey400Color).paddingOnly(top: 6.h),
              ),
            ),
            AppDivider(
              height: 8.h,
              color: AppColors.grey700Color,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (selectedIndex == 1)
                      Container(
                        height: 6.h,
                        width: 6.h,
                        margin: EdgeInsets.only(right: 6.w),
                        decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                      ),

                    /// Tournament start time or live status
                    AppText(
                      text: selectedIndex == 1 ? "${AppString.tournamentIsLive}" : lastMinGameModel.startTime ?? "Start at 12 Jun, 10:00pm",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == 1 ? Colors.red : AppColors.whiteColor,
                    ),
                  ],
                ),
                if (selectedIndex == 2)
                  trophyView()
                else

                  /// Game type view
                  GameTypeView(
                    gameType: lastMinGameModel.gameType ?? GameType.pcGame,
                    iconSize: 16.h,
                  )
              ],
            ).paddingOnly(left: 12.w, right: 12.w, bottom: 4.h, top: 1.h),
          ],
        ),
      ),
    );

    // GameTypeView(gameType: GameType.pcGame),
  }

  Widget trophyView({
    double? iconSize,
    double? textFontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImg(
          imgPath: "assets/icon/png/trophy_icon.png",
          // imgPath: AppAssets.trophyIcon,
          imgSize: 16.h,
          isAssetImg: true,
        ),
        4.w.horizontalSpace,
        AppText(
          text: "4th Rank",
          color: AppColors.blue400Clr,
          fontSize: 12.sp,
        ),
      ],
    );
  }

  void navigateToDetail() {
    if (selectedIndex == upcomingIndex) {
      lastMinGameModel.tournamentStatus = TournamentStatus.joined;
    } else if (selectedIndex == liveIndex) {
      lastMinGameModel.tournamentStatus = TournamentStatus.live;
    } else {
      lastMinGameModel.tournamentStatus = TournamentStatus.completed;
    }
    Navigation.rightToLeft(TournamentDetailScreen(
      lastMinGameModel: lastMinGameModel,
      isFromPayment: true,
    ));
  }
}
