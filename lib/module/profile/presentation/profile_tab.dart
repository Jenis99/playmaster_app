import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/presentation/friends_detail/friends_detail_screen.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/presentation/profile_option/payment_history_screen.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

import 'profile_option/withdraw_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile view
            userProfileView(),

            /// Account section
            profileTitleView(AppString.accountTag).paddingOnly(top: 32.h, bottom: 12.h),

            // Edit profile
            ProfileOptionTile(
              imagePath: AppAssets.userProfileIcon,
              titleName: AppString.editProfile,
              onTap: () {
                Navigation.rightToLeft(EditProfileScreen());
              },
            ),
            //Security
            ProfileOptionTile(
              imagePath: AppAssets.securityIcon,
              titleName: AppString.securityOption,
              onTap: () {
                Navigation.rightToLeft(SecurityScreen());
              },
            ),

            /// Payment section
            profileTitleView(AppString.paymentOption).paddingOnly(top: 32.h, bottom: 12.h),
            // Wallet
            ProfileOptionTile(
              onTap: () {
                Navigation.rightToLeft(AddBalanceScreen());
              },
              imagePath: AppAssets.walletProfileIcon,
              titleName: AppString.walletTag,
            ),
            // Withdraw
            ProfileOptionTile(
              onTap: () {
                Navigation.rightToLeft(WithdrawScreen());
              },
              imagePath: AppAssets.withdrawIcon,
              titleName: AppString.withdrawal,
            ),
            // Payment history
            ProfileOptionTile(
              onTap: () {
                Navigation.rightToLeft(PaymentHistoryScreen());
              },
              imagePath: AppAssets.paymentHistoryIcon,
              titleName: AppString.paymentHistory,
            ),
            // Tds
            ProfileOptionTile(imagePath: AppAssets.tdsIcon, titleName: AppString.tdsAndOther),

            /// Other section
            profileTitleView(AppString.otherTag).paddingOnly(top: 32.h, bottom: 12.h),
            // Help
            ProfileOptionTile(imagePath: AppAssets.helpIcon, titleName: AppString.helpAndSupport),
            // Logout
            ProfileOptionTile(
              onTap: () {
                Navigation.replaceAll(AppRoutes.loginScreen);
              },
              imagePath: AppAssets.logoutIcon,
              titleName: AppString.logoutTag,
              tileColor: AppColors.red20Opacity,
              titleTextColor: AppColors.red400Clr,
            ),
          ],
        ).paddingAll(AppConstants.appHorizontalPadding),
      ),
    );
  }

  Widget profileTitleView(String title) {
    return AppText(
      text: title,
      color: AppColors.grey400Color,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    );
  }

  Widget userProfileView() {
    return UserTile(
      onTap: () {
        Navigation.rightToLeft(FriendsDetailScreen(
          friendName: AppString.dummyUsername,
          isFromProfile: true,
          // isFromMyFriends: true,
        ));
      },
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
