import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class TopGameCard extends StatelessWidget {
  const TopGameCard({super.key, required this.topGameModel});

  final TopGameModel topGameModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigation.pushNamed(AppRoutes.gameDetailScreen, arg: topGameModel.gameName ?? "");
        // Navigation.push(GameDetailScreen(gameTitle: topGameModel.gameName ?? ""));
      },
      contentPadding: EdgeInsets.zero,
      minTileHeight: 80.h,
      // Game image
      leading: CachedNetworkImg(
        imgPath: topGameModel.gameImg ?? "",
        borderRadius: AppConstants.borderRadius,
        imgSize: 80.h,
        fit: BoxFit.cover,
      ),
      // Game name
      title: AppText(
        text: topGameModel.gameName ?? AppString.valorantTag,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      subtitleTextStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          4.verticalSpace,
          AppText(
            text: "${topGameModel.tournamentCount} tournaments",
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grey400Color,
          ),
          12.h.verticalSpace,
          GameTypeView(gameType: topGameModel.gameType ?? GameType.pcGame),
        ],
      ),
    );
  }
}
