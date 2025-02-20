import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Profile view
          userProfileView(),

          /// Account
          AppText(
            text: AppString.accountTag,
            color: AppColors.grey400Color,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ).paddingOnly(top: 32.h, bottom: 12.h),

          ListTile(
            title: AppText(text: "Edit Profile"),
            tileColor: Colors.red,
            contentPadding: EdgeInsets.zero,
          )
        ],
      ).paddingAll(AppConstants.appHorizontalPadding),
    );
  }

  Widget userProfileView() {
    return UserTile(
      tileColor: AppColors.transparentClr,
      titleText: "Noxious John",
      imageSize: 60.h,
      subtitleText: "@noxious_007",
      isAssetImg: true,
      titleFontSize: 18.sp,
      profileImg: AppAssets.appLauncherIcon,
    );
  }
}
