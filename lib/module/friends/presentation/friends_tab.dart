import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';

import 'friend_request_screen.dart';

class FriendsTab extends StatelessWidget {
  FriendsTab({super.key});

  final FriendsController friendsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          isFriendsRequest: true,
          onActionOnTap: () {
            Navigation.rightToLeft(FriendRequestScreen());
          },
        ),
        body: Column(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.appBackgroundClr,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: friendsController.friendsTabController,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerHeight: 0,
                indicator: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.myMatchesShadow), fit: BoxFit.fill),
                ),
                tabs: [
                  Obx(
                    () => tabBarElements(
                        index: 0,
                        title: AppString.exploreFriends,
                        onTap: friendsController.onTabChange,
                        selectedIndex: friendsController.selectedFriendsTabIndex.value),
                  ),
                  Obx(
                    () => tabBarElements(
                        index: 1,
                        title: AppString.myFriends,
                        onTap: friendsController.onTabChange,
                        selectedIndex: friendsController.selectedFriendsTabIndex.value),
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
                controller: friendsController.friendsTabController,
                children: [
                  ExploreFriendsView(),
                  MyFriendsView(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget tabBarElements({
    required final String title,
    required final Function(int) onTap,
    required final int index,
    required final int selectedIndex,
    // required final int titleSize,
  }) {
    return GestureDetector(
      onTap: () {
        onTap.call(index);
      },
      child: Container(
        color: AppColors.transparentClr,
        child: AppText(
          text: title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          fontSize: 12.sp,
          fontWeight: selectedIndex == index ? FontWeight.w700 : FontWeight.w400,
          color: selectedIndex == index ? AppColors.whiteColor : AppColors.grey400Color,
        ),
      ),
    );
  }
}
