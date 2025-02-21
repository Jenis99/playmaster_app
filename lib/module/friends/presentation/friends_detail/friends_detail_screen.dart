import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class FriendsDetailScreen extends StatelessWidget {
  FriendsDetailScreen({Key? key, this.isFromMyFriends = false, required this.friendName, this.isFromProfile = false}) : super(key: key);
  final bool isFromMyFriends;
  final bool isFromProfile;
  final String friendName;

  final FriendsDetailController friendsDetailController = Get.put(FriendsDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        appbarBgClr: AppColors.grey900Color2,
        titleText: friendName,
        isAppLogo: false,
        isShowWallet: false,
      ),
      body: Column(
        children: [
          userProfileView(),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.appBackgroundClr,
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: friendsDetailController.friendDetailTabController,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 0,
                    indicator: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppAssets.myMatchesShadow), fit: BoxFit.fill),
                    ),
                    tabs: [
                      Obx(
                        () => CommonTabBarElement(
                          index: 0,
                          title: AppString.aboutTag,
                          onTap: friendsDetailController.onTabChange,
                          selectedIndex: friendsDetailController.selectedFriendsDetailTabIndex.value,
                        ),
                      ),
                      Obx(
                        () => CommonTabBarElement(
                            index: 1,
                            title: AppString.pastGame,
                            onTap: friendsDetailController.onTabChange,
                            selectedIndex: friendsDetailController.selectedFriendsDetailTabIndex.value),
                      ),
                      Obx(
                        () => CommonTabBarElement(
                            index: 2,
                            title: AppString.gameInfo,
                            onTap: friendsDetailController.onTabChange,
                            selectedIndex: friendsDetailController.selectedFriendsDetailTabIndex.value),
                      ),
                    ],
                  ),
                ),
                AppDivider(
                  height: 1,
                  color: AppColors.grey700Color,
                ),
                Expanded(
                  child: TabBarView(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: friendsDetailController.friendDetailTabController,
                    children: [
                      DetailAboutTab(),
                      PastGameTab(
                        isFromExploreFriends: !isFromMyFriends && !isFromProfile,
                      ),
                      GameInfoTab(
                        isFromExploreFriend: !isFromMyFriends && !isFromProfile,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userProfileView() {
    return Column(
      children: [
        UserTile(
          userData: !isFromProfile ? HomeController.find.joinedPlayerList.first : null,
          trailingIconClr: AppColors.transparentClr,
          isAssetImg: isFromProfile,
          titleText: AppString.dummyUsername,
          subtitleText: AppString.userId,
          profileImg: AppAssets.appLauncherIcon,
          tileColor: AppColors.transparentClr,
          borderRadius: isFromProfile ? 8.r : 100.r,
          // imageSize: 60.h,
        ),
        friendsDetailView(),
        isFromProfile
            ? AppButton(
                onTap: () {
                  Get.to<dynamic>(() => EditProfileScreen(), transition: Transition.rightToLeft);
                },
                text: AppString.editProfile,
                buttonColor: AppColors.blue700Clr,
                height: 34.h,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                buttonMarginPadding: EdgeInsets.symmetric(vertical: 24.h),
              )
            // ? AppButton(
            //     onTap: () {
            //       Navigation.rightToLeft(EditProfileScreen());
            //     },
            //     text: AppString.editProfile,
            //     buttonColor: AppColors.blue700Clr,
            //     height: 34.h,
            //     fontSize: 12.sp,
            //     fontWeight: FontWeight.w500,
            //     buttonPadding: EdgeInsets.symmetric(vertical: 24.h),
            //   )
            : isFromMyFriends
                ? Row(
                    children: [
                      Expanded(
                          child: AppButton(
                        text: AppString.followingTag,
                        height: 34.h,
                        buttonColor: AppColors.whiteColor,
                        textColor: AppColors.grey900Color2,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      )),
                      16.w.horizontalSpace,
                      Expanded(
                          child: AppButton(
                        text: AppString.chatOnDiscord,
                        icon: CachedNetworkImg(
                          imgPath: AppAssets.discordIcon,
                          isAssetImg: true,
                          imgSize: 18.h,
                          fit: BoxFit.fitWidth,
                        ),
                        fontSize: 12.sp,
                        height: 34.h,
                        buttonColor: AppColors.blue700Clr,
                        fontWeight: FontWeight.w500,
                      )),
                    ],
                  ).paddingSymmetric(vertical: 24.h)
                : Obx(
                    () => AppButton(
                      onTap: () {
                        friendsDetailController.isRequested.toggle();
                      },
                      text: friendsDetailController.isRequested.isTrue ? AppString.requestedTag : AppString.sendFrdRequest,
                      buttonColor: friendsDetailController.isRequested.isTrue ? AppColors.grey800Color : AppColors.blue700Clr,
                      height: 34.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      buttonMarginPadding: EdgeInsets.symmetric(vertical: 24.h),
                    ),
                  )
      ],
    ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding);
  }

  Row friendsDetailView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 33, child: friendsDetailText(title: AppString.gamePlayed, score: "432")),
        Expanded(
          flex: 33,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1.h,
                height: 38.h,
                margin: EdgeInsets.only(right: 12.w),
                color: AppColors.grey700Color,
              ),
              friendsDetailText(title: AppString.friends, score: "343"),
            ],
          ),
        ),
        Expanded(
          flex: 33,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 12.w),
                width: 1.h,
                height: 38.h,
                color: AppColors.grey700Color,
              ),
              friendsDetailText(title: AppString.joinedTag, score: "12 June 2024"),
            ],
          ),
        ),
      ],
    );
  }

  Widget friendsDetailText({required String title, required String score}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: title,
          color: AppColors.grey400Color,
          fontSize: 12.sp,
        ),
        4.h.verticalSpace,
        AppText(
          text: score,
          color: AppColors.whiteColor,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
