import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/auth/presentation/verify_otp_screen.dart';

class LoginWithNumberScreen extends StatelessWidget {
  const LoginWithNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.loginBgImg,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppRichText(
                    fontSize: 30.sp,
                    secondTitle: "!",
                    firstFontWeight: FontWeight.w600,
                    firstTitle: AppString.welcomeTag,
                    firstTitleColor: AppColors.whiteColor,
                    secondTitleColor: AppColors.primaryColor,
                  ),
                  20.h.verticalSpace,
                  AppTextField(
                    showBorder: false,
                    fontSize: 16.sp,
                    hintText: AppString.yourNumber,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    hintStyle: TextStyle(color: AppColors.hintTextColor, fontSize: 16.sp),
                    color: AppColors.lightGreyColor.withValues(alpha: 0.8),
                  ),
                  20.h.verticalSpace,
                  AppButton(
                    onTap: () {
                      Navigation.push(VerifyOtpScreen());
                    },
                    text: AppString.signInTag,
                  ),
                  20.h.verticalSpace,
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
