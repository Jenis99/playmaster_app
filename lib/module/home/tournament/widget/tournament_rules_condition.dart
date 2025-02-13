import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

// ignore: must_be_immutable
class TournamentRulesCondition extends StatelessWidget {
  TournamentRulesCondition({super.key});

  List<String> rulesList = [AppString.prohibitCheating, AppString.encourageRespectful, AppString.addressPenalties, AppString.specifyWhether];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TournamentDetailTile(
          icon: AppAssets.rulesCondition,
          title: AppString.tournamentRulesCondition,
        ).paddingSymmetric(vertical: 20.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            rulesList.length,
            (index) => rulesText("${index + 1}. ${rulesList[index]}"),
          ),
        )
      ],
    );
  }

  Widget rulesText(String title) => AppText(
    text: title,
        color: AppColors.grey400Color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        maxLines: 2,
      );
}
