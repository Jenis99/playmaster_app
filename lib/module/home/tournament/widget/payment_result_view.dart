import 'package:playmaster_ui/dependency.dart';

class PaymentResultView extends StatelessWidget {
  const PaymentResultView({Key? key, required this.isPaymentSuccess, this.isFromWithdraw = false}) : super(key: key);
  final bool isPaymentSuccess;
  final bool isFromWithdraw;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImg(
          imgPath: isPaymentSuccess ? AppAssets.successPaymentImg : AppAssets.failedPaymentImg,
          isAssetImg: true,
          imgSize: 100.h,
        ),
        32.h.verticalSpace,
        AppText(
          text: isFromWithdraw
              ? AppString.withdrawSuccess
              : isPaymentSuccess
                  ? AppString.successfullyAdded
                  : AppString.transactionFail,
          fontSize: 18.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        8.h.verticalSpace,
        AppText(
          text: isFromWithdraw
              ? AppString.withdrawDescription
              : isPaymentSuccess
                  ? AppString.yourAmountHasBeing
                  : AppString.dueToTechnicalError,
          maxLines: 2,
          textAlign: TextAlign.center,
          fontSize: 14.sp,
          color: AppColors.grey400Color,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
