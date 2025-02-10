import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class TournamentRulesCondition extends StatelessWidget {
  const TournamentRulesCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TournamentDetailTile(
          icon: AppAssets.rulesCondition,
          title: AppString.tournamentRulesCondition,
        ).paddingSymmetric(vertical: 20.h),
        rulesText(AppString.prohibitCheating),
        rulesText(AppString.encourageRespectful),
        rulesText(AppString.addressPenalties),
        rulesText(AppString.specifyWhether),
      ],
    );
  }

  Widget rulesText(String title) => AppText(
        text: title,
        color: AppColors.grey400Color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
}
