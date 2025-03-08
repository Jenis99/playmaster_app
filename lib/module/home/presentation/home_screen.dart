import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/widget/last_minute_game_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Game list
            SizedBox(height: Get.height * 0.37, child: const GameCarouselView()),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.h.verticalSpace,

                /// Your match is Live
                const TournamentTitle(title: AppString.yourMatchIsLive, isSingleTitle: true),
                liveGameCard(),
                30.h.verticalSpace,

                /// Top Games Tournaments
                const TournamentTitle(title: AppString.topGamesTournament),
                24.h.verticalSpace,
                ListView.builder(
                  itemCount: homeController.topGameList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => TopGameCard(
                    topGameModel: homeController.topGameList[index],
                  ),
                ),

                50.h.verticalSpace,

                /// Last minutes
                const TournamentTitle(title: AppString.lastMinutes),
                20.h.verticalSpace,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeController.lastGameModelList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.13),
                    // childAspectRatio: .55,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemBuilder: (context, index) => LastMinuteGameCard(lastMinGameModel: homeController.lastGameModelList[index]),
                ),
              ],
            ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
          ],
        ),
      ),
    );
  }

  Widget liveGameCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
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
              imgPath: AppAssets.rupeesCurrencyIcon,
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
