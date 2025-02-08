import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/widget/last_minute_game_card.dart';
import 'package:playmaster_ui/widgets/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Game list
            SizedBox(height: Get.height * 0.42, child: GameCarouselView()),

            /// Top Games Tournaments
            tournamentTitle(title: AppString.topGamesTournament),
            8.verticalSpace,
            ListView.builder(
              itemCount: homeController.topGameList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => TopGameCard(
                topGameModel: homeController.topGameList[index],
              ),
            ),

            20.h.verticalSpace,

            /// Last minutes
            tournamentTitle(title: AppString.lastMinutes),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.gameList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .65,
              ),
              itemBuilder: (context, index) => LastMinuteGameCard(),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }

  /// TournamentTitle title
  Widget tournamentTitle({required String title, void Function()? onViewAll, bool isSingleTitle = false}) {
    return Row(
      mainAxisAlignment: isSingleTitle ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        /// Game title
        AppText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.whiteColor,
        ),

        /// View all
        !isSingleTitle
            ? GestureDetector(
                onTap: onViewAll,
                child: Container(
                  color: AppColors.transparentClr,
                  child: AppText(
                    text: AppString.viewAll,
                    color: AppColors.blue500Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: AppColors.appBackgroundClr,
      title: Row(
        children: [
          Image.asset(
            AppAssets.appLogo,
            height: 24.h,
            width: 24.h,
          ),
          GradientText(
            gradient: LinearGradient(colors: AppColors.appNameTextGradient),
            child: AppText(
              text: AppString.appName.toUpperCase(),
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          decoration: BoxDecoration(
            color: AppColors.grey800Color,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              AppText(
                text: "2000",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ).paddingOnly(
                top: 4.h,
                bottom: 4.h,
                left: 12.w,
              ),
              12.w.horizontalSpace,
              Image.asset(
                AppAssets.walletIcon,
                height: 28.h,
                width: 28.h,
              )
            ],
          ),
        )
      ],
      automaticallyImplyLeading: false,
    );
  }
}
