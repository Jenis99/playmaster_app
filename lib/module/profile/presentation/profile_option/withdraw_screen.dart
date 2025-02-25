import 'package:dotted_border/dotted_border.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/presentation/profile_option/withdraw_to_upi_screen.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({Key? key}) : super(key: key);

  final TextEditingController addAmountController = TextEditingController();
  final List<String> amountSuggestionList = [
    "100",
    "200",
    "500",
    "1000",
  ];
  final RxString enterAmount = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundClr,
      appBar: HomeAppBar(
        isShowWallet: false,
        isAppLogo: false,
        titleText: AppString.withdrawTag,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    balanceView(),
                    45.h.verticalSpace,
                    // Enter amount to withdraw
                    AppText(
                      text: AppString.enterAmountToWithdraw,
                      color: AppColors.grey400Color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    10.h.verticalSpace,
                    AppTextField(
                      controller: addAmountController,
                      contentPadding: EdgeInsets.only(top: 10.h),
                      prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: AppColors.greenClr,
                        size: 22.sp,
                      ),
                      prefixIconPadding: 0,
                      keyboardType: TextInputType.number,
                      fontSize: 22.sp,
                      isTapOutsideEnable: true,
                      onChanged: (String? updatedValue) {
                        enterAmount.value = "${(updatedValue?.isNotEmpty ?? false) ? "₹" : ""}${updatedValue ?? " "}";
                      },
                      color: AppColors.transparentClr,
                      textFieldOrder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey700Color),
                      ),
                    ),
                    16.h.verticalSpace,
                    Row(
                      children: List.generate(
                          amountSuggestionList.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  addAmountController.text = amountSuggestionList[index];
                                  enterAmount.value = "₹${amountSuggestionList[index]}";
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration:
                                      BoxDecoration(color: AppColors.grey800Color, borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
                                  child: AppText(text: "₹${amountSuggestionList[index]}"),
                                  padding: EdgeInsets.all(
                                    8.sp,
                                  ),
                                ),
                              )),
                    ),
                    Spacer(),

                    /// Add balance button
                    AppButton(
                      text: AppString.confirmTag,
                      buttonColor: AppColors.whiteColor,
                      textColor: AppColors.grey900Color,
                      onTap: () {
                        Get.to(() => WithdrawToUpiScreen());
                        Navigation.push(WithdrawToUpiScreen());
                      },
                    ),
                  ],
                ).paddingAll(AppConstants.appHorizontalPadding),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget balanceView() {
    return DottedBorder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.5.h),
      borderType: BorderType.RRect,
      color: AppColors.grey900Color2,
      dashPattern: [8, 3],
      radius: Radius.circular(AppConstants.borderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppConstants.borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImg(
                      imgPath: AppAssets.tournamentWalletIcon,
                      isAssetImg: true,
                      imgSize: 18.h,
                    ),
                    4.w.horizontalSpace,
                    AppText(
                      text: AppString.availableForWithdraw,
                      fontSize: 14.sp,
                    ),
                  ],
                )
              ],
            ),
            AppText(
              text: "₹1200",
              color: AppColors.greenClr,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
