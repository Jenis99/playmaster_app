import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/tournament/presentation/tournament_detail_screen.dart';
import 'package:playmaster_ui/module/home/tournament/widget/payment_result_view.dart';

class FailPaymentScreen extends StatelessWidget {
  const FailPaymentScreen({Key? key, this.lastMinGameModel}) : super(key: key);
  final LastMinGameModel? lastMinGameModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        PaymentResultView(isPaymentSuccess: false),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: AppString.backToTournament,
              textColor: AppColors.whiteColor,
              isBorderButton: true,
              buttonColor: AppColors.transparentClr,
              buttonMarginPadding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
              onTap: () {
                navigateToDetailScreen();
              },
            ),
            AppButton(
              text: AppString.tryAgain,
              textColor: AppColors.grey900Color2,
              buttonColor: AppColors.whiteColor,
              buttonMarginPadding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding, vertical: 16.h),
              onTap: () {
                navigateToDetailScreen();
              },
            ),
          ],
        ),
      ],
    ));
  }

  void navigateToDetailScreen() {
    Navigation.popupUtil(AppRoutes.dashboardScreen);
    Navigation.rightToLeft(
      (TournamentDetailScreen(
        isFromPayment: true,
        lastMinGameModel: lastMinGameModel,
      )),
    );
  }
}
