import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/dashboard/dashboard.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/my_matches/my_matches.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with WidgetsBindingObserver {
  final DashboardController _dashBoardController = Get.put(DashboardController())..selectedTabIndex.refresh();
  final MyMatchesController myMatchesController = Get.put(MyMatchesController());
  final FriendsController friendsController = Get.put(FriendsController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _dashBoardController.selectedTabIndex(0);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundClr,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.appBackgroundClr,
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _dashBoardController.tabController,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              dividerHeight: 0,
              indicator: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.bottomBarShadow)),
              ),
              tabs: [
                Obx(
                  () => bottomNavigationBarElement(
                    title: AppString.homeTab,
                    icon: AppAssets.homeIcon,
                    index: 0,
                    selectedIndex: _dashBoardController.selectedTabIndex.value,
                    onTap: _dashBoardController.onTabChange,
                  ),
                ),
                Obx(
                  () => bottomNavigationBarElement(
                    title: AppString.myMatches,
                    icon: AppAssets.myMatchesIcon,
                    index: 1,
                    selectedIndex: _dashBoardController.selectedTabIndex.value,
                    onTap: _dashBoardController.onTabChange,
                  ),
                ),
                Obx(
                  () => bottomNavigationBarElement(
                    title: AppString.friends,
                    icon: AppAssets.friendsIcon,
                    index: 2,
                    selectedIndex: _dashBoardController.selectedTabIndex.value,
                    onTap: _dashBoardController.onTabChange,
                  ),
                ),
                Obx(
                  () => bottomNavigationBarElement(
                    title: AppString.profile,
                    icon: AppAssets.profileIcon,
                    index: 3,
                    selectedIndex: _dashBoardController.selectedTabIndex.value,
                    onTap: _dashBoardController.onTabChange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _dashBoardController.tabController,
              children: [
                HomeScreen(),
                MyMatchesTab(),
                FriendsTab(),
                const ProfileTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBarElement({
    required final String title,
    required final String icon,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            4.verticalSpace,
            CachedNetworkImg(
              imgPath: icon,
              imgSize: 24.h,
              isAssetImg: true,
              imgColor: selectedIndex == index ? AppColors.whiteColor : AppColors.grey400Color,
            ),
            4.verticalSpace,
            AppText(
              text: title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontSize: 11.sp,
              fontWeight: selectedIndex == index ? FontWeight.w700 : FontWeight.w400,
              color: selectedIndex == index ? AppColors.whiteColor : AppColors.grey400Color,
            ),
          ],
        ),
      ),
    );
  }
}
