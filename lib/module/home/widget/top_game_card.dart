import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';

class TopGameCard extends StatelessWidget {
  const TopGameCard({super.key, required this.topGameModel});

  final TopGameModel topGameModel;

  @override
  Widget build(BuildContext context) {
    final isPcGame = topGameModel.gameType == GameType.pcGame;
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,

      // Game image
      leading: CachedNetworkImg(
        imgPath: topGameModel.gameImg ?? "",
        borderRadius: 4.r,
        imgSize: 80.h,
        // fit: BoxFit.fitHeight,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImg(
                imgPath: isPcGame ? AppAssets.pcGameIcon : AppAssets.mobileGameIcon,
                imgSize: 18.h,
                isAssetImg: true,
              ),
              8.w.horizontalSpace,
              AppText(
                text: topGameModel.gameType?.getTitle(topGameModel.gameType ?? GameType.pcGame) ?? "",
                color: isPcGame ? AppColors.yellow400Clr : AppColors.pink500Clr,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
