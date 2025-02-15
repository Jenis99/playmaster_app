import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';
import 'package:playmaster_ui/module/home/home.dart';

// ignore: must_be_immutable
class PaymentBottomView extends StatelessWidget {
  PaymentBottomView({Key? key, this.lastMinGameModel}) : super(key: key);
  final LastMinGameModel? lastMinGameModel;

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
        5.h.verticalSpace,
        TournamentTitle(
          title: AppString.totalAmount,
          subTitle: "₹500",
          subtitleColor: AppColors.whiteColor,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        15.h.verticalSpace,
        AppDivider(
          color: AppColors.grey700Color,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return paymentTile(listOsPaymentOpt[index], index);
          },
          scrollDirection: Axis.vertical,
          itemCount: listOsPaymentOpt.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),

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
          onTap: () async {
            try {
              Navigation.pop();
              await Get.to<dynamic>(() => SuccessPaymentScreen(lastMinGameModel: lastMinGameModel), transition: Transition.rightToLeft);

              // Navigation.rightToLeft(SuccessPaymentScreen(
              //   lastMinGameModel: lastMinGameModel,
              // ));
            } catch (e, st) {
              print("call this on error $e :: $st");
            }
          },
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
          decoration: BoxDecoration(
              image: selectedPaymentIndex.value == index
                  ? DecorationImage(
                      image: AssetImage(
                        AppAssets.paymentShadow,
                      ),
                      fit: BoxFit.cover,
                    )
                  : null),
          child: ListTile(
            title: AppText(
              text: paymentData.title,
              color: AppColors.whiteColor,
            ),
            subtitle: AppText(
              text: paymentData.subtitle,
              color: AppColors.grey400Color,
            ),
            trailing: CachedNetworkImg(
              isAssetImg: true,
              imgHeight: 16.h,
              // imgWidth: 100.w,
              // fit: BoxFit.fill,
              imgPath: paymentData.icon,
            ),
          ),
        ),
      ),
    );
  }
}
