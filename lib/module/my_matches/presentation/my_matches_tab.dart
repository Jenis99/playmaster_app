import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/my_matches/completed/completed_tournament_screen.dart';
import 'package:playmaster_ui/module/my_matches/live/live_tournament_screen.dart';
import 'package:playmaster_ui/module/my_matches/my_matches.dart';

class MyMatchesTab extends StatelessWidget {
  MyMatchesTab({super.key});

  final MyMatchesController matchesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: Column(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.appBackgroundClr,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: matchesController.matchTabController,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerHeight: 0,
                indicator: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.myMatchesShadow), fit: BoxFit.fill),
                ),
                tabs: [
                  Obx(
                    () => bottomNavigationBarElement(
                        index: 0,
                        title: AppString.upcomingTab,
                        onTap: matchesController.onTabChange,
                        selectedIndex: matchesController.selectedMatchTabIndex.value),
                  ),
                  Obx(
                    () => bottomNavigationBarElement(
                        index: 1,
                        title: AppString.liveTag,
                        onTap: matchesController.onTabChange,
                        selectedIndex: matchesController.selectedMatchTabIndex.value),
                  ),
                  Obx(
                    () => bottomNavigationBarElement(
                        index: 2,
                        title: AppString.completedTab,
                        onTap: matchesController.onTabChange,
                        selectedIndex: matchesController.selectedMatchTabIndex.value),
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
                physics: const NeverScrollableScrollPhysics(),
                controller: matchesController.matchTabController,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  UpcomingTournamentScreen(),
                  LiveTournamentScreen(),
                  CompletedTournamentScreen(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget bottomNavigationBarElement({
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
