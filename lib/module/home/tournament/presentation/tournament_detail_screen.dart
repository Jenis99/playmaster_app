import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/last_minute_game_model.dart';
import 'package:playmaster_ui/model/model.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/home/tournament/presentation/add_balance_screen.dart';

class TournamentDetailScreen extends StatelessWidget {
  TournamentDetailScreen({super.key, this.isFromPayment = false});

  final bool isFromPayment;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final LastMinGameModel lastMinGameModel = Get.arguments ?? LastMinGameModel();

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
                  GameDetailCardTile(
                    lastMinGameModel: lastMinGameModel,
                    isFromTournament: true,
                    isFromPayment: isFromPayment,
                  ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
                  30.h.verticalSpace,

                  /// Prize pool
                  const TournamentDetailTile(
                    icon: AppAssets.prizePoolIcon,
                    title: AppString.prizePool,
                  ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),

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
                    itemBuilder: (context, index) => JoinedPlayerTile(userData: homeController.joinedPlayerList[index]),
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
                    // Navigation.push(Container());
                    Navigation.push(AddBalanceScreen());
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
        ],
      ),
    );
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
