import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/tournament/presentation/fail_payment_screen.dart';
import 'package:playmaster_ui/module/home/tournament/widget/payment_result_view.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key, this.lastMinGameModel, this.isFromWithdraw = false}) : super(key: key);
  final LastMinGameModel? lastMinGameModel;
  final bool isFromWithdraw;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          PaymentResultView(
            isPaymentSuccess: true,
            isFromWithdraw: isFromWithdraw,
          ),
          AppButton(
            text: isFromWithdraw
                ? AppString.goBackToWithdraw
                : lastMinGameModel != null
                    ? AppString.backToTournament
                    : AppString.goBackToWallet,
            textColor: AppColors.grey900Color2,
            buttonColor: AppColors.whiteColor,
            onTap: () {
              if (isFromWithdraw) {
                Navigation.popupUtil(AppRoutes.dashboardScreen);
                return;
              }
              Navigation.rightToLeft((FailPaymentScreen(
                lastMinGameModel: lastMinGameModel,
              )));
            },
            buttonMarginPadding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
          ).paddingOnly(bottom: 20.h),
        ],
      ),
    );
  }
}
