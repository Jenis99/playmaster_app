import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';
import 'package:playmaster_ui/module/home/home.dart';

class WithdrawToUpiScreen extends StatelessWidget {
  WithdrawToUpiScreen({Key? key}) : super(key: key);

  final upiTextController = TextEditingController();
  final isVerified = false.obs;
  final isTextFieldNotEmpty = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        isShowWallet: false,
        isAppLogo: false,
        titleText: AppString.withdrawTag,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextFieldWithLabel(
                textFieldController: upiTextController,
                hintText: AppString.enterUpiAddress,
                labelName: AppString.upiId,
                isBottomPaddingApply: false,
                textFieldClr: AppColors.grey900Color2,
                isDoneField: true,
                onChanged: (p0) {
                  print("AuthTextFieldWithLabel call $p0");
                  isTextFieldNotEmpty(p0.isNotEmpty);
                  isVerified.value = validateUpiID(p0).isEmpty;
                },
              ),
              8.h.verticalSpace,
              Obx(() => isTextFieldNotEmpty.isTrue && isVerified.isTrue
                  ? Obx(
                      () => Row(
                        children: [
                          Icon(
                            isVerified.isTrue ? Icons.verified_outlined : Icons.cancel_outlined,
                            size: 16.sp,
                            color: isVerified.isTrue ? AppColors.green500Clr : AppColors.red500Clr,
                          ),
                          5.w.horizontalSpace,
                          AppText(
                            text: isVerified.isTrue ? AppString.verified : AppString.invalid,
                            fontSize: 14.sp,
                            color: isVerified.isTrue ? AppColors.green500Clr : AppColors.red500Clr,
                          )
                        ],
                      ),
                    )
                  : SizedBox())
            ],
          ),
          Obx(
            () => AppButton(
              onTap: () async {
                if (isVerified.isTrue) {
                  await Get.to<dynamic>(() => SuccessPaymentScreen(isFromWithdraw: true), transition: Transition.rightToLeft);
                }
              },
              text: AppString.withdrawal,
              textColor: AppColors.whiteColor,
              buttonColor: AppColors.primaryColor.withOpacity(isVerified.isTrue ? 1 : 0.5),
            ),
          ),
        ],
      ).paddingAll(AppConstants.appHorizontalPadding),
    );
  }

  String validateUpiID(String value) {
    String pattern = '[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please Enter UPI ID';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter valid UPI ID';
    } else {
      return "";
    }
  }
}
