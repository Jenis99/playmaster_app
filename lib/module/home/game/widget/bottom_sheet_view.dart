import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key, required this.isFromPoolSize, required this.homeController});

  final bool isFromPoolSize;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Horizontal grey line
        Container(
          height: 4.h,
          width: 50.h,
          margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.grey700Color,
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        TournamentTitle(
          title: isFromPoolSize ? AppString.prizePool : AppString.startIn,
          subTitle: AppString.cancelTag,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        20.h.verticalSpace,
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: isFromPoolSize ? homeController.gamePoolSize.length : homeController.gameStartTimeList.length,
          itemBuilder: (context, index) {
            final String title = isFromPoolSize ? homeController.gamePoolSize[index].label : homeController.gameStartTimeList[index];
            return Obx(() => isFromPoolSize ? selectPoolSizeBottomView(title: title) : selectStartTimeBottomView(title: title));
          },
          shrinkWrap: true,
        ),
      ],
    );
  }

  /// Select Start time Bottom sheet view
  Widget selectStartTimeBottomView({required String title, String? subTitle, bool isFromPool = false}) {
    final isSelected = homeController.selectedStartTime.value == title;
    return GestureDetector(
      onTap: () {
        homeController.selectedStartTime.value = title;
        Navigation.pop();
      },
      child: bottomSelectionView(
        child: Row(
          mainAxisAlignment: isSelected ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            AppText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            if (isSelected) Icon(Icons.check, size: 20.sp),
          ],
        ).paddingSymmetric(vertical: 5.h),
        isSelected: isSelected,
      ),
    );
  }

  /// Select Pool Size Bottom sheet view
  Widget selectPoolSizeBottomView({required String title, String? subTitle, bool isFromPool = false}) {
    final isSelected = homeController.selectedPoolSize.value == title;
    return GestureDetector(
      onTap: () {
        homeController.selectedPoolSize.value = title;
        Navigation.pop();
      },
      child: bottomSelectionView(
        child: Container(
          child: Row(
            mainAxisAlignment: isSelected ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              if (isSelected) Icon(Icons.check, size: 20.sp),
            ],
          ).paddingSymmetric(vertical: 5.h),
        ),
        isSelected: isSelected,
      ),
    );
  }

  /// Bottom sheet selection view with shadow
  Widget bottomSelectionView({required Widget child, required bool isSelected}) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          image: (isSelected)
              ? const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppAssets.bottomSheetShadow),
                )
              : null),
      child: child,
    );
  }
}
