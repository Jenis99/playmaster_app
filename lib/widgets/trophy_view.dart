import 'package:playmaster_ui/dependency.dart';

class TrophyView extends StatelessWidget {
  const TrophyView({Key? key, this.iconSize, this.textFontSize, this.rankNumber}) : super(key: key);
  final double? iconSize;
  final double? textFontSize;
  final int? rankNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImg(
          // imgPath: "assets/icon/png/trophy_icon.png",
          imgPath: AppAssets.trophyIcon,
          imgSize: 16.h,
          isAssetImg: true,
        ),
        4.w.horizontalSpace,
        AppText(
          text: "${rankNumber ?? 4}th Rank",
          color: AppColors.blue400Clr,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
