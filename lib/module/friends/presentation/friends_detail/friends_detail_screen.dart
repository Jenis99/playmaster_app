import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/controller/friends_detail_controller.dart';
import 'package:playmaster_ui/module/friends/presentation/friends_detail/game_info_tab.dart';
import 'package:playmaster_ui/module/friends/presentation/friends_detail/past_game_tab.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/widgets/common_tab_bar_element.dart';

import 'detail_about_tab.dart';

class FriendsDetailScreen extends StatelessWidget {
  FriendsDetailScreen({Key? key, this.isFromMyFriends = false, required this.friendName}) : super(key: key);
  final bool isFromMyFriends;
  final String friendName;

  final FriendsDetailController friendsDetailController = Get.put(FriendsDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
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
                      PastGameTab(),
                      GameInfoTab(),
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
        JoinedPlayerTile(
          userData: Get.find<HomeController>().joinedPlayerList.first,
          trailingIconClr: AppColors.transparentClr,
          tileColor: AppColors.transparentClr,
          borderRadius: 100.r,
          // imageSize: 60.h,
        ),
        friendsDetailView(),
        AppButton(
          text: AppString.sendFrdRequest,
          buttonColor: AppColors.blueClr,
          height: 34.h,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          buttonPadding: EdgeInsets.symmetric(vertical: 24.h),
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
              friendsDetailText(title: AppString.friends, score: "43223"),
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
              friendsDetailText(title: AppString.joinedTag, score: "43223" * 3),
            ],
          ),
        ),
      ],
    );
  }

  Column friendsDetailText({required String title, required String score}) {
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
