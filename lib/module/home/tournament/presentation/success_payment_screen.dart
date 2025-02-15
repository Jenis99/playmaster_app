import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';
import 'package:playmaster_ui/module/home/tournament/presentation/fail_payment_screen.dart';
import 'package:playmaster_ui/module/home/tournament/widget/payment_result_view.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key, this.lastMinGameModel}) : super(key: key);
  final LastMinGameModel? lastMinGameModel;

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
          onTap: () => Navigation.rightToLeft((FailPaymentScreen(
            lastMinGameModel: lastMinGameModel,
          ))),
          buttonPadding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
        ),
      ],
    ));
  }
}
