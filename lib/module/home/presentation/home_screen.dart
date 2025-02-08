import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/widget/last_minute_game_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Game list
            SizedBox(height: Get.height * 0.42, child: const GameCarouselView()),

            tournamentTitle(title: AppString.yourMatchIsLive, isSingleTitle: true),
            liveGameCard(),

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
              itemCount: homeController.lastGameModelList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .56),
              itemBuilder: (context, index) => LastMinuteGameCard(
                lastMinGameModel: homeController.lastGameModelList[index],
              ),
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

  Widget liveGameCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        tileColor: AppColors.grey900Color2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppText(text: AppString.valorantGameName),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 6.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(16.sp)),
              child: AppText(
                text: AppString.liveTag,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImg(
              imgPath: AppAssets.rupeesIcon,
              isAssetImg: true,
              imgSize: 15.h,
            ),

            /// Entry fee
            AppText(
              fontSize: 12.sp,
              color: AppColors.greenClr,
              fontWeight: FontWeight.w500,
              text: " 1000 Prize pool",
            )
          ],
        ).paddingOnly(right: 8.w, top: 12.h),
      ),
    ).paddingSymmetric(vertical: 24.h);
  }
}
