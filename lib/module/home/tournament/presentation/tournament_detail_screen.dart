import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

class TournamentDetailScreen extends StatelessWidget {
  TournamentDetailScreen({
    super.key,
    this.isFromPayment = false,
    this.lastMinGameModel,
  });

  final LastMinGameModel? lastMinGameModel;
  final bool isFromPayment;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        titleText: AppString.tournamentDetails,
        isAppLogo: false,
        isShowWallet: false,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Live video view
                  if (isFromPayment && lastMinGameModel?.tournamentStatus == TournamentStatus.live)
                    TournamentVideoView(
                      homeController: homeController,
                    ),

                  /// Game card
                  GameDetailCardTile(
                    lastMinGameModel: lastMinGameModel ?? LastMinGameModel(),
                    isFromTournament: true,
                    isFromPayment: isFromPayment,
                  ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),

                  /// Prize pool
                  if (isShowRankList)
                    const TournamentDetailTile(
                      icon: AppAssets.prizePoolIcon,
                      title: AppString.prizePool,
                    ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),

                  if (isShowRankList) 30.h.verticalSpace,
                  if (isShowRankList)
                    ListView.separated(
                      itemCount: homeController.rankPriceList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: AppConstants.appHorizontalPadding),
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
                  ).paddingSymmetric(vertical: 20.h, horizontal: AppConstants.appHorizontalPadding),

                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: AppConstants.appHorizontalPadding),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.joinedPlayerList.length,
                    itemBuilder: (context, index) => UserTile(userData: homeController.joinedPlayerList[index]),
                  ),
                  AppText(
                    text: AppString.viewAll,
                    textAlign: TextAlign.center,
                    color: AppColors.blue500Color,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ).paddingOnly(top: 16.h, bottom: 15.h),
                  // Rules and condition of tournament
                  TournamentRulesCondition().paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
                  20.h.verticalSpace,
                ],
              ),
            ),
          ),

          /// Join tournament button view
          if (!isFromPayment)
            Obx(
              () => JoinTournamentButtonView(
                balanceAmount: homeController.isShowAddBalance.value ? "100" : "2000",
                buttonTitle: homeController.isShowAddBalance.value ? AppString.addBalanceToJoin : AppString.joinTournament,
                entryFee: "500",
                buttonColor: homeController.isShowAddBalance.value ? AppColors.whiteColor : AppColors.primaryColor,
                textColor: homeController.isShowAddBalance.value ? AppColors.grey900Color2 : AppColors.whiteColor,
                onPress: () {
                  if (homeController.isShowAddBalance.value) {
                    // Future.delayed(duration)
                    // Navigation.pop();
                    Navigation.rightToLeft(AddBalanceScreen(
                      lastMinGameModel: lastMinGameModel,
                    ));
                    homeController.isShowAddBalance.value = false;
                    return;
                  }
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                    builder: (context) {
                      return confirmPaymentBottomView();
                    },
                  );
                },
              ),
            ),

          if (isFromPayment && lastMinGameModel?.tournamentStatus == TournamentStatus.live)
            AppButton(
                buttonPadding: EdgeInsets.all(16.w),
                text: AppString.goToYoutube,
                onTap: () {
                  _launchUrl();
                }),
        ],
      ),
    );
  }

  bool get isShowRankList => isFromPayment && lastMinGameModel?.tournamentStatus != TournamentStatus.completed;

  Future<void> _launchUrl() async {
    Uri gameUrl = Uri.parse("https://www.youtube.com/watch?v=IX2Emps0al4");

    if (!await launchUrl(gameUrl)) {
      throw Exception('Could not launch ${gameUrl}');
    }
  }

  void listenOnUpdate() {
    print("listenOnUpdate call start");
  }

  Widget confirmPaymentBottomView() {
    return Container(
      color: AppColors.appBackgroundClr,
      padding: EdgeInsets.fromLTRB(AppConstants.appHorizontalPadding, 0, AppConstants.appHorizontalPadding, 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.h,
            width: 50.h,
            margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.grey700Color,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),

          /// Confirm payment
          TournamentTitle(
            title: AppString.confirmPayment,
            subTitle: AppString.cancelTag,
            onViewAll: () => Navigation.pop(),
          ),
          20.h.verticalSpace,

          /// Tournament entry fee
          TournamentTitle(
            title: AppString.tournamentEntryFee,
            subTitle: "₹450",
            titleFontWeight: FontWeight.w500,
            titleFontSize: 14.sp,
            subtitleFontSize: 14.sp,
            subtitleFontWeight: FontWeight.w500,
            subtitleColor: AppColors.whiteColor,
            titleColor: AppColors.grey400Color,
          ),
          16.h.verticalSpace,

          /// TDS and other tax
          TournamentTitle(
            title: AppString.tdsAndOther,
            subTitle: "₹50",
            titleFontWeight: FontWeight.w500,
            titleFontSize: 14.sp,
            subtitleFontSize: 14.sp,
            subtitleFontWeight: FontWeight.w500,
            subtitleColor: AppColors.whiteColor,
            titleColor: AppColors.grey400Color,
          ),
          AppDivider(color: AppColors.grey700Color),

          /// Total amount
          TournamentTitle(
            title: AppString.totalAmount,
            subTitle: "₹ 500",
            titleFontSize: 16.sp,
            subtitleFontSize: 16.sp,
            titleFontWeight: FontWeight.w700,
            subtitleFontWeight: FontWeight.w700,
            subtitleColor: AppColors.whiteColor,
          ).paddingSymmetric(vertical: 16.h),

          /// Confirm payment button
          AppButton(
            text: AppString.confirmPayment,
            onTap: () {
              homeController.isShowAddBalance.value = true;
              Navigation.pop();
            },
          )
        ],
      ),
    );
  }
}
