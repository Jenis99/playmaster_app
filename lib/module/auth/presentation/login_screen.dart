import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                    AuthTextFieldWithLabel(
                      labelName: AppString.usernameTag,
                      hintText: AppString.enterUsername,
                      isEmailField: true,
                      textFieldController: authController.usernameController,
                    ),

                    // Enter Username
                    AuthTextFieldWithLabel(
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
                        CachedNetworkImg(imgPath: AppAssets.facebookIcon, imgSize: 26.h, isAssetImg: true),
                        CachedNetworkImg(imgPath: AppAssets.googleIcon, imgSize: 26.h, isAssetImg: true).paddingSymmetric(horizontal: 24.w),
                        CachedNetworkImg(imgPath: AppAssets.appleLogin, imgSize: 26.h, isAssetImg: true),
                      ],
                    ).paddingOnly(bottom: 20.h),

                    const Spacer(),
                    // Expanded(
                    //   child: Container(
                    //     color: Colors.red,
                    //   ),
                    // ),
                    AppButton(
                      text: AppString.loginTag,
                      onTap: () {
                        Navigation.replaceAll(AppRoutes.dashboardScreen);
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
                ),
              ),
            ),
          );
        },
      ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
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
