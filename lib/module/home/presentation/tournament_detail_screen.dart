import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';
import 'package:playmaster_ui/module/home/home.dart';

class TournamentDetailScreen extends StatelessWidget {
  TournamentDetailScreen({super.key, required this.lastMinGameModel});

  final LastMinGameModel lastMinGameModel;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        titleText: AppString.tournamentDetails,
        isAppLogo: false,
        isShowWallet: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GameDetailCardTile(
              lastMinGameModel: lastMinGameModel,
              isFromTournament: true,
            ),
            30.h.verticalSpace,
            // Prize pool
            const TournamentDetailTile(
              icon: AppAssets.prizePoolIcon,
              title: AppString.prizePool,
            ),

            ListView.separated(
              itemCount: homeController.rankPriceList.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final rankPriceData = homeController.rankPriceList[index];
                return PrizePoolTile(
                  title: rankPriceData.name,
                  icon: rankPriceData.icon,
                  price: rankPriceData.price,
                );
              },
            ),

            // Joined player
            const TournamentDetailTile(
              icon: AppAssets.joinedUserIcon,
              title: AppString.joinedPlayer,
              subtitle: "15 ${AppString.playerJoined}",
            ).paddingSymmetric(vertical: 20.h),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.joinedPlayerList.length,
              itemBuilder: (context, index) => JoinedPlayerTile(userData: homeController.joinedPlayerList[index]),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
