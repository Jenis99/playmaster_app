import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

// ignore: must_be_immutable
class PaymentBottomView extends StatelessWidget {
  // PaymentBottomView({Key? key}) : super(key: key);

  List<({String title, String subtitle, String icon})> listOsPaymentOpt = [
    (icon: AppAssets.googlePayIcon, title: AppString.googlePay, subtitle: AppString.payWithUpi),
    (icon: AppAssets.paytmIcon, title: AppString.paytm, subtitle: AppString.payWithUpiOrWallet),
    (icon: AppAssets.razorpayIcon, title: AppString.razorPay, subtitle: AppString.payWithUpiOrWalletOrCard),
  ];
  RxInt selectedPaymentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Center(
          child: Container(
            height: 4.h,
            width: 50.h,
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.grey700Color,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
        TournamentTitle(
          title: AppString.totalAmount,
          subTitle: "₹500",
          subtitleColor: AppColors.whiteColor,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        20.h.verticalSpace,
        AppDivider(
          color: AppColors.grey700Color,
        ),
        // ListView.builder(
        //   itemBuilder: (context, index) {
        //     return paymentTile(listOsPaymentOpt[index], index);
        //   },
        //   itemCount: listOsPaymentOpt.length,
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        // ),

        ///
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: List.generate(
        //     listOsPaymentOpt.length,
        //     (index) => paymentTile(listOsPaymentOpt[index], index),
        //   ),
        // ),
        AppButton(
          text: AppString.payTag,
          buttonPadding: EdgeInsets.all(AppConstants.appHorizontalPadding),
        )
      ],
    );
  }

  Widget paymentTile(({String title, String subtitle, String icon}) paymentData, index) {
    return GestureDetector(
      onTap: () {
        selectedPaymentIndex.value = index;
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(image: selectedPaymentIndex.value == index ? DecorationImage(image: AssetImage(AppAssets.paymentShadow)) : null),
          child: ListTile(
            title: AppText(
              text: paymentData.title,
              color: AppColors.whiteColor,
            ),
            subtitle: AppText(
              text: paymentData.subtitle,
              color: AppColors.grey400Color,
            ),
            trailing: FittedBox(
              child: CachedNetworkImg(
                isAssetImg: true,
                imgHeight: 16.h,
                imgPath: paymentData.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
