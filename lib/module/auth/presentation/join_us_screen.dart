import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/auth/presentation/your_detail_screen.dart';

class JoinUsScreen extends StatelessWidget {
  JoinUsScreen({super.key});

  final RxInt selectedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.joinUsTodayBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppRichText(
            fontSize: 30.sp,
            firstTitle: AppString.joinUsTag,
            secondTitle: " ${AppString.todayTag}",
            firstFontWeight: FontWeight.w600,
            firstTitleColor: AppColors.whiteColor,
            secondTitleColor: AppColors.primaryColor,
          ),
          Row(
            children: [
              Obx(() => UserTypeView(isOwnerType: true, isSelected: selectedIndex.value == 0)),
              10.w.horizontalSpace,
              Obx(() => UserTypeView(isSelected: selectedIndex.value == 1)),
            ],
          ),
          AppButton(
            onTap: () {
              Navigation.push(YourDetailScreen());
            },
            text: AppString.continuerTag,
          ),
          100.h.verticalSpace
        ],
      ),
    );
  }

  Expanded UserTypeView({
    bool isOwnerType = false,
    bool isSelected = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectedIndex.value = isOwnerType ? 0 : 1;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          decoration: BoxDecoration(
              color: AppColors.whiteColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(AppConstants.commonRadius),
              border: Border.all(color: isSelected ? AppColors.primaryColor : AppColors.transparentClr)),
          child: Column(
            children: [
              Image.asset(isOwnerType ? AppAssets.ownerIcn : AppAssets.loaderTruckIcn, height: 42.h, width: 42.w),
              AppText(
                text: isOwnerType ? AppString.ownerOrDrive : AppString.loaderOrCustomer,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
