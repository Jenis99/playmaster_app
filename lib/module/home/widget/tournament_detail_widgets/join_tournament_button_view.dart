import 'package:playmaster_ui/dependency.dart';

class JoinTournamentButtonView extends StatelessWidget {
  const JoinTournamentButtonView({super.key, required this.buttonTitle, required this.entryFee, required this.balanceAmount, required this.onPress});

  final String buttonTitle;
  final String entryFee;
  final String balanceAmount;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColors.grey900Color2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "₹ $entryFee entry fee"),
              walletView(),
            ],
          ),
          16.h.verticalSpace,
          AppButton(
            text: AppString.joinTournament,
            onTap: onPress,
          )
        ],
      ),
    );
  }

  Widget walletView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImg(
          imgPath: AppAssets.tournamentWalletIcon,
          isAssetImg: true,
          imgSize: 18.h,
        ),
        4.w.horizontalSpace,
        AppText(
          text: "Balance: ₹$balanceAmount",
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
