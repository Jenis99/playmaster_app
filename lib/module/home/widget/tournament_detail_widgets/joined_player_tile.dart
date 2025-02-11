import 'package:playmaster_ui/dependency.dart';

class JoinedPlayerTile extends StatelessWidget {
  const JoinedPlayerTile({super.key, required this.userData, this.isMyProfileData = false});

  final ({String profileImg, String username, String userId}) userData;
  final bool isMyProfileData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: ListTile(
        dense: true,
        horizontalTitleGap: AppConstants.appHorizontalPadding,
        minLeadingWidth: 0,
        tileColor: AppColors.grey900Color2,
        contentPadding: EdgeInsets.zero,
        title: AppText(
          text: userData.username,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        leading: CachedNetworkImg(
          imgPath: userData.profileImg,
          imgSize: 50.h,
          borderRadius: 4.r,
        ).paddingOnly(left: 4.w),
        trailing: !isMyProfileData
            ? Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.h,
              ).paddingOnly(right: 8.w)
            : null,
        minVerticalPadding: 2,
        subtitle: AppText(
          text: userData.userId,
          color: AppColors.grey400Color,
        ),
      ),
    ).paddingSymmetric(vertical: 5.h);
  }
}
