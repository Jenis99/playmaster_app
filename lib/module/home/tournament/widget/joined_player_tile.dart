import 'package:playmaster_ui/dependency.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key,
      this.userData,
      this.isMyProfileData = false,
      this.tileColor,
      this.trailingIconClr,
      this.onTap,
      this.borderRadius,
      this.imageSize,
      this.isShowTrophy = false,
      this.rankNumber,
      this.playerID = "",
      this.trailing,
      this.titleText,
      this.subtitleText,
      this.profileImg,
      this.isAssetImg = false,
      this.titleFontSize,
      this.subtitleFontSize});

  final ({String profileImg, String username, String userId})? userData;
  final bool isMyProfileData;
  final Widget? trailing;
  final Color? tileColor;
  final Color? trailingIconClr;
  final void Function()? onTap;
  final double? borderRadius;
  final double? imageSize;
  final bool isShowTrophy;
  final bool isAssetImg;
  final String playerID;
  final String? titleText;
  final String? subtitleText;
  final String? profileImg;
  final String? rankNumber;
  final double? titleFontSize;
  final double? subtitleFontSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: ListTile(
        dense: true,
        onTap: onTap,
        horizontalTitleGap: AppConstants.appHorizontalPadding,
        minLeadingWidth: 0,
        tileColor: tileColor ?? AppColors.grey900Color2,
        contentPadding: EdgeInsets.zero,
        title: AppText(
          text: titleText ?? userData?.username ?? "",
          fontSize: titleFontSize ?? 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        leading: CachedNetworkImg(
          imgPath: profileImg ?? userData?.profileImg ?? "",
          imgSize: imageSize ?? 50.h,
          isAssetImg: isAssetImg,
          borderRadius: borderRadius ?? AppConstants.borderRadius,
        ).paddingOnly(left: 4.w),
        trailing: trailing ??
            (!isMyProfileData
                ? Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15.h,
                    color: trailingIconClr,
                  ).paddingOnly(right: 8.w)
                : null),
        minVerticalPadding: 2,
        subtitle: playerID.isNotEmpty
            ? playerIdView()
            : isShowTrophy
                ? TrophyView()
                : AppText(
          text: playerID.isNotEmpty ? "${AppString.playerId}: ${playerID}" : subtitleText ?? userData?.userId ?? "",
                    color: AppColors.grey400Color,
                    fontSize: subtitleFontSize ?? 14.sp,
                  ),
      ),
    ).paddingSymmetric(vertical: 5.h);
  }

  RichText playerIdView() {
    return RichText(
      text: TextSpan(
        text: AppString.playerId + ": ",
        style: TextStyle(fontSize: 12.sp, color: AppColors.grey400Color),
        children: <TextSpan>[
          TextSpan(
              text: playerID,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              )),
        ],
      ),
    );
  }
}
