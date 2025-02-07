import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/dashboard/dashboard.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/my_matches/my_matches.dart';
import 'package:playmaster_ui/module/profile/presentation/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with WidgetsBindingObserver {
  final DashboardController _dashBoardController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            backgroundColor: AppColors.appBackgroundClr,
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _dashBoardController.tabController,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                const MyMatchesScreen(),
                const FriendsScreen(),
                const ProfileScreen(),
              ],
            ),
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
                      bottomNavigationBarElement(
                        title: AppString.homeTab,
                        icon: AppAssets.homeIcon,
                        index: 0,
                        onTap: _dashBoardController.onTabChange,
                      ),
                      bottomNavigationBarElement(
                        title: AppString.myMatches,
                        icon: AppAssets.myMatchesIcon,
                        index: 1,
                        onTap: _dashBoardController.onTabChange,
                      ),
                      bottomNavigationBarElement(
                        title: AppString.friends,
                        icon: AppAssets.friendsIcon,
                        index: 2,
                        onTap: _dashBoardController.onTabChange,
                      ),
                      bottomNavigationBarElement(
                        title: AppString.profile,
                        icon: AppAssets.profileIcon,
                        index: 3,
                        onTap: _dashBoardController.onTabChange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomNavigationBarElement({
    required final String title,
    required final String icon,
    required final Function(int) onTap,
    required final int index,
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
            Obx(
              () => Image.asset(
                icon,
                height: 22.h,
                width: 22.h,
                color: _dashBoardController.selectedTabIndex.value == index ? AppColors.whiteColor : AppColors.grey400Color,
              ),
            ),
            4.verticalSpace,
            Obx(
              () => AppText(
                text: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                fontWeight: _dashBoardController.selectedTabIndex.value == index ? FontWeight.w700 : FontWeight.w400,
                color: _dashBoardController.selectedTabIndex.value == index ? AppColors.whiteColor : AppColors.grey400Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
