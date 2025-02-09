import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/widget/game_detail_widget/bottom_sheet_view.dart';

class GameDetailScreen extends StatelessWidget {
  GameDetailScreen({super.key, required this.gameTitle});

  final String gameTitle;
  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundClr,
      appBar: HomeAppBar(
        isAppLogo: false,
        titleText: gameTitle,
        appbarBgClr: AppColors.appBackgroundClr,
      ),
      body: Column(
        children: [
          /// Category view
          gameCategoryView().paddingOnly(left: 16.w),

          24.verticalSpace,

          /// Game selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Start in
              Obx(() => commonGameFilter(
                context: context,
                    title: AppString.startIn,
                    filterValue: homeController.selectedStartTime.value,
                    isFromPool: false,
                  )),

              // Pool size
              Obx(() => commonGameFilter(
                context: context,
                    title: AppString.poolSize,
                    isFromPool: true,
                    filterValue: homeController.selectedPoolSize.value,
                  )),
            ],
          ).paddingSymmetric(horizontal: 16.w),

          20.h.verticalSpace,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: homeController.lastGameModelList.length,
              itemBuilder: (context, index) {
                return GameDetailCardTile(lastMinGameModel: homeController.lastGameModelList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  /// Game filter category card
  Widget commonGameFilter({required BuildContext context, required String title, required String filterValue, required bool isFromPool}) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: AppColors.appBackgroundClr,
          context: context,
          builder: (context) {
            return BottomSheetView(
              homeController: homeController,
              isFromPoolSize: isFromPool,
            );
          },
        );
      },
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "$title: ",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grey400Color,
                fontWeight: FontWeight.w500,
              ),
              // style: com  monStyle(),
              children: <TextSpan>[
                TextSpan(
                  text: " ${isFromPool ? (filterValue.split(" ").first ?? "") : filterValue}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                  // recognizer: TapGestureRecognizer()..onTap = () => Navigation.pop(),
                ),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.whiteColor,
            size: 20.h,
          )
        ],
      ),
    );
  }

  /// Game category view
  Widget gameCategoryView() {
    return SizedBox(
      height: 32.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            homeController.gameType.length,
            (index) {
              return gameCategoryBox(homeController.gameType[index], index);
            },
          ),
        ),
      ),
    );
  }

  /// Game category
  Widget gameCategoryBox(String gameType, int index) {
    return GestureDetector(
      onTap: () {
        homeController.selectedGameType.value = index;
      },
      child: Obx(
        () => Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: BoxDecoration(
              color: homeController.selectedGameType.value == index ? AppColors.primaryColor : AppColors.grey800Color,
              borderRadius: BorderRadius.circular(4.r)),
          child: AppText(
            text: gameType ?? "All category",
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
