import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/home/presentation/home_screen.dart';

class YourDetailScreen extends StatelessWidget {
  const YourDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.yourDetailBg,
            fit: BoxFit.cover,
          ),
        ),
        // Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.loginBgImg),fit: BoxFit.cover)),),
        SingleChildScrollView(
          child: Container(
            color: AppColors.transparentClr,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Column(
                spacing: 20.h,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppRichText(
                    fontSize: 30.sp,
                    secondTitle: " ${AppString.detailsTag}",
                    firstFontWeight: FontWeight.w600,
                    firstTitle: AppString.yourTag,
                    firstTitleColor: AppColors.whiteColor,
                    secondTitleColor: AppColors.primaryColor,
                  ),
                  AppTextField(
                    showBorder: false,
                    fontSize: 16.sp,
                    hintText: AppString.yourNameTag,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    hintStyle: TextStyle(color: AppColors.hintTextColor, fontSize: 16.sp),
                    color: AppColors.lightGreyColor.withValues(alpha: 0.8),
                  ),
                  AppTextField(
                    showBorder: false,
                    fontSize: 16.sp,
                    hintText: AppString.yourCityTag,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    hintStyle: TextStyle(color: AppColors.hintTextColor, fontSize: 16.sp),
                    color: AppColors.lightGreyColor.withValues(alpha: 0.8),
                  ),
                  AppButton(
                    onTap: () {
                      Navigation.push(HomeScreen());
                    },
                    text: AppString.submitTag,
                  ),
                  AppRichText(
                    fontSize: 14.sp,
                    secondTitle: " ${AppString.signUpTag}",
                    firstFontWeight: FontWeight.w600,
                    firstTitle: AppString.donTHaveAccount,
                    firstTitleColor: AppColors.whiteColor,
                    secondTitleColor: AppColors.purpleClr,
                  ),
                  110.h.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
