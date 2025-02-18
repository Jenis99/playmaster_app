import 'package:playmaster_ui/dependency.dart';

class JoinedPlayerTile extends StatelessWidget {
  const JoinedPlayerTile(
      {super.key,
      required this.userData,
      this.isMyProfileData = false,
      this.tileColor,
      this.trailingIconClr,
      this.onTap,
      this.borderRadius,
      this.imageSize});

  final ({String profileImg, String username, String userId}) userData;
  final bool isMyProfileData;
  final Color? tileColor;
  final Color? trailingIconClr;
  final void Function()? onTap;
  final double? borderRadius;
  final double? imageSize;

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
          text: userData.username,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        leading: CachedNetworkImg(
          imgPath: userData.profileImg,
          imgSize: imageSize ?? 50.h,
          borderRadius: borderRadius ?? AppConstants.borderRadius,
        ).paddingOnly(left: 4.w),
        trailing: !isMyProfileData
            ? Icon(
          Icons.arrow_forward_ios_outlined,
                size: 15.h,
                color: trailingIconClr,
              ).paddingOnly(right: 8.w)
            : null,
        minVerticalPadding: 2,
        subtitle: AppText(
          text: userData.userId,
          color: AppColors.grey400Color,
          fontSize: 14.sp,
        ),
      ),
    ).paddingSymmetric(vertical: 5.h);
  }
}
