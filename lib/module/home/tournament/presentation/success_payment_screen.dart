import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/tournament/presentation/fail_payment_screen.dart';
import 'package:playmaster_ui/module/home/tournament/widget/payment_result_view.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        PaymentResultView(isPaymentSuccess: true),
        AppButton(
          text: AppString.backToTournament,
          textColor: AppColors.grey900Color2,
          buttonColor: AppColors.whiteColor,
          onTap: () => Navigation.push(FailPaymentScreen()),
          buttonPadding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
        ),
      ],
    ));
  }
}
