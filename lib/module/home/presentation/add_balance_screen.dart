import 'package:dotted_border/dotted_border.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class AddBalanceScreen extends StatelessWidget {
  AddBalanceScreen({Key? key}) : super(key: key);

  TextEditingController addAmountController = TextEditingController();
  List<String> amountSuggestionList = [
    "₹100:",
    "₹200",
    "₹500",
    "₹1000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundClr,
        appBar: HomeAppBar(
          isShowWallet: false,
          isAppLogo: false,
          titleText: AppString.addBalance,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            balanceView(),
            45.h.verticalSpace,
            // Enter amount to add
            AppText(
              text: AppString.enterAmountToAdd,
              color: AppColors.grey400Color,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            TextField(
              controller: addAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: AppColors.transparentClr,
                  focusColor: AppColors.transparentClr,
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey700Color))),
            ),
            16.h.verticalSpace,
            Row(
              children: List.generate(
                  amountSuggestionList.length,
                  (index) => GestureDetector(
                        onTap: () {
                          addAmountController.text = amountSuggestionList[index];
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(color: AppColors.grey800Color, borderRadius: BorderRadius.circular(4.r)),
                          child: AppText(text: amountSuggestionList[index]),
                          padding: EdgeInsets.all(
                            8.sp,
                          ),
                        ),
                      )),
            ),
            Spacer(),
            AppButton(text: "Add ${addAmountController.text}", buttonColor: AppColors.whiteColor, textColor: AppColors.grey900Color, onTap: () {})
          ],
        ).paddingAll(AppConstants.appHorizontalPadding));
  }

  Widget balanceView() {
    return DottedBorder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.5.h),
      borderType: BorderType.RRect,
      color: AppColors.grey900Color2,
      radius: Radius.circular(4.r),
      // padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
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
