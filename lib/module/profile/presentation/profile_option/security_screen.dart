import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({Key? key}) : super(key: key);
  final ProfileController profileController = ProfileController.find;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        appbarBgClr: AppColors.grey900Color2,
        titleText: AppString.securityOption,
        isAppLogo: false,
        isShowWallet: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthTextFieldWithLabel(
                    isDoneField: false,
                    isTapOutsideEnable: true,
                    labelName: AppString.currentPassword,
                    textFieldClr: AppColors.grey900Color2,
                    hintText: AppString.enterCurrentPassword,
                    isPasswordField: true,
                    textFieldController: profileController.currentPasswordController,
                  ),
                  AuthTextFieldWithLabel(
                    isDoneField: false,
                    isPasswordField: true,
                    isTapOutsideEnable: true,
                    labelName: AppString.newPassword,
                    hintText: AppString.enterNewPassword,
                    textFieldClr: AppColors.grey900Color2,
                    textFieldController: profileController.newPasswordController,
                  ),
                  AuthTextFieldWithLabel(
                    isDoneField: true,
                    isTapOutsideEnable: true,
                    isPasswordField: true,
                    labelName: AppString.confirmPassword,
                    hintText: AppString.confirmPassword,
                    textFieldClr: AppColors.grey900Color2,
                    textFieldController: profileController.confirmPasswordController,
                  ),
                ],
              ).paddingAll(AppConstants.appHorizontalPadding),
            ),
          ),
          Container(
            color: AppColors.grey900Color2,
            child: AppButton(
              text: AppString.updatePassword,
              onTap: () {
                Navigation.pop();
              },
              buttonMarginPadding: EdgeInsets.all(AppConstants.appHorizontalPadding),
            ),
          )
        ],
      ),
    );
  }
}
