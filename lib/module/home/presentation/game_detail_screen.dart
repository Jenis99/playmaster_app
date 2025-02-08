import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

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
                    title: AppString.startIn,
                    filterValue: homeController.selectedStartTime.value,
                    // onTap: () {
                    //   showModalBottomSheet(
                    //     backgroundColor: AppColors.appBackgroundClr,
                    //     context: context,
                    //     builder: (context) {
                    //       return commonBottomView();
                    //     },
                    //   );
                    // },
                  )),

              // Pool size
              Obx(() => commonGameFilter(
                    title: AppString.poolSize,
                    filterValue: homeController.selectedPoolSize.value,
                    // onTap: () {
                    //   showModalBottomSheet(
                    //     backgroundColor: AppColors.appBackgroundClr,
                    //     context: context,
                    //     builder: (context) {
                    //       return commonBottomView();
                    //     },
                    //   );
                    // },
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

  /// Select Start time sheet
  Widget commonBottomView(bool isFromPoolSize) {
    return Column(
      children: [
        Container(
          height: 4.h,
          width: 50.h,
          margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.appBackgroundClr,
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        TournamentTitle(title: isFromPoolSize ? AppString.prizePool : AppString.startIn, subTitle: AppString.cancelTag)
            .paddingSymmetric(horizontal: 16.w),
        20.h.verticalSpace,
        ListView.builder(
          itemCount: isFromPoolSize ? homeController.gamePoolSize.length : homeController.gameStartTimeList.length,
          itemBuilder: (context, index) {
            return selectStartTimeBottomView(
                title: isFromPoolSize ? homeController.gamePoolSize[index].label : homeController.gameStartTimeList[index]);
          },
          shrinkWrap: true,
        ),
      ],
    );
  }

  /// Bottom sheet view
  Widget selectStartTimeBottomView({required String title, String? subTitle, bool isFromPool = false}) {
    return GestureDetector(
      onTap: () {
        if (isFromPool) {
          homeController.selectedPoolSize.value = title;
        } else {
          homeController.selectedStartTime.value = title;
        }
      },
      child: Obx(
        () => Container(
            margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              image: (isFromPool && homeController.selectedStartTime.value == title)
                  ? const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAssets.bottomSheetShadow),
                    )
                  : null,
            ),
            child: Row(
              mainAxisAlignment: homeController.selectedStartTime.value == title ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                if (homeController.selectedStartTime.value == title) Icon(Icons.check, size: 20.sp),
              ],
            ).paddingSymmetric(horizontal: 16.w, vertical: 5.h)),
      ),
    );
  }

  Widget commonGameFilter({required String title, required String filterValue, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
                  text: " $filterValue",
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
