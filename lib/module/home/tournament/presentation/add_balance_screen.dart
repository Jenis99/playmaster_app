import 'package:dotted_border/dotted_border.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

// ignore: must_be_immutable
class AddBalanceScreen extends StatelessWidget {
  AddBalanceScreen({Key? key, this.lastMinGameModel}) : super(key: key);

  final LastMinGameModel? lastMinGameModel;

  TextEditingController addAmountController = TextEditingController();
  List<String> amountSuggestionList = [
    "100",
    "200",
    "500",
    "1000",
  ];
  RxString enterAmount = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundClr,
      appBar: HomeAppBar(
        isShowWallet: false,
        isAppLogo: false,
        titleText: AppString.addBalance,
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
                    // Enter amount to add
                    AppText(
                      text: AppString.enterAmountToAdd,
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
                    Obx(() => AppButton(
                          text: "Add ${enterAmount.value}",
                          buttonColor: AppColors.whiteColor,
                          textColor: AppColors.grey900Color,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: AppColors.appBackgroundClr,
                              builder: (context) => PaymentBottomView(
                                lastMinGameModel: lastMinGameModel,
                              ),
                            );
                          },
                        )),
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
      color: AppColors.grey700Color,
      dashPattern: [8, 3],
      radius: Radius.circular(AppConstants.borderRadius),
      // padding: EdgeInsets.all(6),
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
                      text: AppString.balanceTag,
                      fontSize: 14.sp,
                    ),
                  ],
                )
              ],
            ),
            AppText(
              text: "₹100",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
