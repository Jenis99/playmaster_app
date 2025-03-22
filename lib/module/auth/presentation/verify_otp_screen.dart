import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/auth/presentation/join_us_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
                    secondTitle: " ${AppString.numberTag}",
                    firstFontWeight: FontWeight.w600,
                    firstTitle: AppString.verifyTag,
                    firstTitleColor: AppColors.whiteColor,
                    secondTitleColor: AppColors.primaryColor,
                  ),
                  20.h.verticalSpace,
                  //
                  AppText(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    text: "${AppString.enterTheOtpSentTo} +91 ***98",
                    color: AppColors.textLightGreyClr,
                  ),
                  20.h.verticalSpace,
                  OtpTextField(
                    numberOfFields: 4,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    borderColor: AppColors.transparentClr,
                    borderWidth: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    textStyle: TextStyle(fontSize: 20, color: AppColors.lightWhiteClr),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                    fillColor: AppColors.whiteColor.withValues(alpha: 0.1),

                    disabledBorderColor: AppColors.transparentClr,
                    enabledBorderColor: AppColors.transparentClr,
                    // contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
                    focusedBorderColor: AppColors.transparentClr,
                    filled: true,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    borderRadius: BorderRadius.circular(AppConstants.commonRadius),
                  ),
                  20.h.verticalSpace,
                  AppButton(
                    onTap: () {
                      Navigation.push(JoinUsScreen());
                    },
                    text: AppString.verifyTag,
                  ),
                  20.h.verticalSpace,
                  AppRichText(
                    fontSize: 14.sp,
                    secondTitle: " ${AppString.resendOtp}",
                    firstFontWeight: FontWeight.w600,
                    firstTitle: AppString.didNotReceiveOtp,
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

  String maskMobileNumber(String phoneNumber) {
    if (phoneNumber.length < 5) return phoneNumber; // Handle short numbers

    String countryCode = phoneNumber.substring(0, 3); // Extract "+91"
    String lastTwoDigits = phoneNumber.substring(phoneNumber.length - 2); // Extract "98"

    return "$countryCode ***$lastTwoDigits";
  }
}
