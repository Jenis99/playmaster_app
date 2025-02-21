import 'package:playmaster_ui/dependency.dart';

class GameTypeView extends StatelessWidget {
  const GameTypeView({super.key, required this.gameType, this.iconSize, this.textFontSize});

  final GameType gameType;
  final double? iconSize;
  final double? textFontSize;

  @override
  Widget build(BuildContext context) {
    bool isPcGame = gameType == GameType.pcGame;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImg(
          imgPath: isPcGame ? AppAssets.pcGameIcon : AppAssets.mobileGameIcon,
          imgSize: iconSize ?? 18.h,
          isAssetImg: true,
        ),
        8.w.horizontalSpace,
        AppText(
          text: gameType.gameLabel,
          color: isPcGame ? AppColors.yellow400Clr : AppColors.pink500Clr,
          fontSize: textFontSize ?? 14.sp,
        ),
      ],
    );
  }
}
