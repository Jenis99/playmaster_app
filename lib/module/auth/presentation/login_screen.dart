import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.h.verticalSpace,

            /// Create account heading
            AppText(
              text: AppString.welcomeBack,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
              fontStyle: FontStyle.italic,
              fontSize: 24.sp,
            ),

            8.h.verticalSpace,
            AppText(
              maxLines: 2,
              text: AppString.welcomeBackSubtitle,
              fontWeight: FontWeight.w400,
              color: AppColors.grey400Color,
              fontSize: 14.sp,
            ),
            48.h.verticalSpace,
            // Enter Username
            textFiledWithLabel(
              labelName: AppString.usernameTag,
              hintText: AppString.enterUsername,
              textFieldController: authController.usernameController,
            ),

            // Enter Username
            textFiledWithLabel(
              labelName: AppString.passwordTag,
              hintText: AppString.enterPassword,
              textFieldController: authController.passwordController,
              isPasswordField: true,
            ),
            // Or continue with
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: AppDivider()),
                const AppText(text: AppString.orContinueWith).paddingSymmetric(horizontal: 10),
                const Expanded(child: AppDivider()),
              ],
            ),

            32.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.facebookIcon, height: 26.h),
                Image.asset(AppAssets.googleIcon, height: 26.h).paddingSymmetric(horizontal: 24.w),
                Image.asset(AppAssets.appleLogin, height: 26.h),
              ],
            ),
            const Spacer(),
            AppButton(
              text: AppString.loginTag,
              onTap: () {
                Navigation.pushNamed(AppRoutes.dashboardScreen);
              },
            ).paddingOnly(bottom: 16.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: AppString.doNotHaveAcc,
                  style: commonStyle(),
                  children: <TextSpan>[
                    TextSpan(
                      text: " ${AppString.createAccount}",
                      style: commonStyle(textColor: AppColors.whiteColor, fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigation.pop(),
                    ),
                  ],
                ),
              ),
            ).paddingOnly(bottom: 24.h),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
      ),
    );
  }

  Widget textFiledWithLabel({
    String? labelName,
    String? hintText,
    bool isPasswordField = false,
    bool isEmailField = false,
    required TextEditingController textFieldController,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: labelName ?? "",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        8.h.verticalSpace,
        AppTextField(
          controller: textFieldController,
          hintText: hintText,
          obscureText: isPasswordField,
          keyboardType: isEmailField ? TextInputType.emailAddress : TextInputType.text,
          textInputAction: (isEmailField || isPasswordField) ? TextInputAction.next : TextInputAction.done,
          height: 64.h,
        )
      ],
    );
  }

  TextStyle commonStyle({double? fontSize, FontWeight? fontWeight, Color? textColor}) {
    return TextStyle(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: textColor ?? AppColors.grey400Color,
    );
  }
}
