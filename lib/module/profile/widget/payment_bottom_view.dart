import 'package:dotted_border/dotted_border.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/presentation/profile_option/payment_history_screen.dart';
import 'package:playmaster_ui/module/profile/presentation/profile_option/withdraw_screen.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class WalletBottomView extends StatelessWidget {
  const WalletBottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Horizontal grey line
        Container(
          height: 4.h,
          width: 50.h,
          margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.grey700Color,
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        TournamentTitle(
          title: AppString.paymentOption,
          subTitle: AppString.closeTag,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        28.h.verticalSpace,
        balanceView(),
        // Wallet
        ProfileOptionTile(
          onTap: () {
            Navigation.rightToLeft(AddBalanceScreen());
          },
          imagePath: AppAssets.walletProfileIcon,
          titleName: AppString.walletTag,
          tileColor: AppColors.transparentClr,
        ),
        AppDivider(height: .7, color: AppColors.grey800Color),
        // Withdraw
        ProfileOptionTile(
          onTap: () {
            Navigation.rightToLeft(WithdrawScreen());
          },
          imagePath: AppAssets.withdrawIcon,
          titleName: AppString.withdrawal,
          tileColor: AppColors.transparentClr,
        ),
        AppDivider(height: .7, color: AppColors.grey800Color),

        // Payment history
        ProfileOptionTile(
          onTap: () {
            Navigation.push(PaymentHistoryScreen());
          },
          imagePath: AppAssets.paymentHistoryIcon,
          titleName: AppString.paymentHistory,
          tileColor: AppColors.transparentClr,
        ),
        AppDivider(height: .7, color: AppColors.grey800Color),
        10.h.verticalSpace,
      ],
    ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding, vertical: 5.h);
  }

  Widget balanceView() {
    return DottedBorder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.5.h),
      borderType: BorderType.RRect,
      color: AppColors.grey900Color2,
      dashPattern: [8, 3],
      radius: Radius.circular(AppConstants.borderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppConstants.borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImg(
                      imgPath: AppAssets.tournamentWalletIcon,
                      isAssetImg: true,
                      imgSize: 18.h,
                    ),
                    4.w.horizontalSpace,
                    AppText(
                      text: AppString.balanceTag,
                      fontSize: 14.sp,
                    ),
                  ],
                )
              ],
            ),
            AppText(
              text: "₹100",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
