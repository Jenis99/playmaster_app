import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/controller/payment_history_controller.dart';
import 'package:playmaster_ui/utils/app_utils.dart';

class PaymentSubTabView extends StatelessWidget {
  PaymentSubTabView({Key? key, required this.currentTab}) : super(key: key);
  final int currentTab;

  final PaymentHistoryController paymentHistoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        transactionCategoryBox(),
        ListView.separated(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            final gameData = paymentHistoryController.paymentList[index];
            bool isShowMonth = false || index == 0;
            if (index != 0) {
              String currentDate = AppUtils.getFormattedDate(gameData.dateOfTransaction, onlyMonthYear: true);
              String previousDate = AppUtils.getFormattedDate(paymentHistoryController.paymentList[index - 1].dateOfTransaction, onlyMonthYear: true);
              isShowMonth = currentDate != previousDate;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isShowMonth) monthTile(paymentHistoryController.paymentList[index].dateOfTransaction),
                commonPaymentTile(
                  dateOfTranslation: gameData.dateOfTransaction,
                  gameId: gameData.id,
                  gameName: gameData.gameName,
                  amount: gameData.amount,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => AppDivider(color: AppColors.grey800Color).paddingSymmetric(horizontal: 16.w),
        ),
      ],
    );
  }

  // Group by month tile
  Widget monthTile(int milliseconds) {
    return Container(
      color: AppColors.grey900Color2,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: AppText(
        text: AppUtils.getFormattedDate(milliseconds, onlyMonthYear: true),
        color: AppColors.grey400Color,
      ),
    );
  }

  // Common payment history tile
  Widget commonPaymentTile({required String gameName, required String gameId, required int dateOfTranslation, required String amount}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: AppText(
        text: gameName,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: "ID: $gameId",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400Color,
          ),
          AppText(
            text: AppUtils.getFormattedDate(dateOfTranslation),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400Color,
          ),
        ],
      ),
      trailing: AppText(
        text: "$amount",
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: currentTab == 1
            ? AppColors.red500Clr
            : currentTab == 2
                ? AppColors.green500Clr
                : AppColors.grey400Color,
      ),
    );
  }

  /// Transaction category
  Widget transactionCategoryBox({String? gameType, int? index}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          paymentHistoryController.paymentCategoryList.length,
          (index) {
            return GestureDetector(
              onTap: () {
                onSelectCategoryOption(index);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    (index == 0) ? 16.w : 4.w, 0, (index == paymentHistoryController.paymentCategoryList.length - 1) ? 16.w : 4.w, 0),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(color: AppColors.grey800Color, borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
                child: AppText(
                  text: paymentHistoryController.paymentCategoryList[index],
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            );
          },
        ),
      ).paddingSymmetric(vertical: 20.h),
    );
  }

  void onSelectCategoryOption(int index) {
    if (index != 0) {
      showModalBottomSheet(
        context: Get.context!,
        backgroundColor: AppColors.grey900Color2,
        builder: (context) {
          if (index == 2) {
            return gamePlatformBottomView();
          } else if (index == 1) {
            return transactionStatusBottomView();
          } else {
            return Container();
          }
        },
      );
    } else {
      showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2024),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              datePickerTheme: const DatePickerThemeData(
                backgroundColor: AppColors.appBackgroundClr,
              ),
              colorScheme: ColorScheme.dark(
                brightness: Brightness.dark,
                primary: AppColors.primaryColor,
                onPrimary: AppColors.whiteColor,
                onSurface: Colors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
    }
  }

  Widget gamePlatformBottomView() {
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
          title: AppString.gamePlatform,
          subTitle: AppString.cancelTag,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        10.h.verticalSpace,
        Column(
          children: List.generate(
            paymentHistoryController.gamePlatformList.length,
            (index) {
              final platformType = paymentHistoryController.gamePlatformList[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  paymentHistoryController.selectedGameType.value = platformType;
                },
                title: AppText(
                  text: platformType.platformLabel,
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                leading: Obx(
                  () => Radio<GamePlatformType>(
                    value: platformType,
                    activeColor: AppColors.primaryColor,
                    groupValue: paymentHistoryController.selectedGameType.value,
                    onChanged: (GamePlatformType? value) {
                      paymentHistoryController.selectedGameType.value = value ?? GamePlatformType.allGames;
                    },
                  ),
                ),
              );
            },
          ),
        ),
        AppButton(
          text: AppString.saveTag,
          buttonMarginPadding: EdgeInsets.all(16.h),
        )
      ],
    ).paddingSymmetric(horizontal: 5.w);
  }

  Widget transactionStatusBottomView() {
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
          title: AppString.transactionStatus,
          subTitle: AppString.cancelTag,
          onViewAll: () => Navigation.pop(),
        ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
        10.h.verticalSpace,
        Column(
          children: List.generate(
            paymentHistoryController.transactionStatusList.length,
            (index) {
              final platformType = paymentHistoryController.transactionStatusList[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  paymentHistoryController.selectedTransaction.value = platformType;
                },
                title: AppText(
                  text: platformType.statusLabel,
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                leading: Obx(
                  () => Radio<TransactionStatus>(
                    value: platformType,
                    activeColor: AppColors.primaryColor,
                    groupValue: paymentHistoryController.selectedTransaction.value,
                    onChanged: (TransactionStatus? value) {
                      paymentHistoryController.selectedTransaction.value = value ?? TransactionStatus.allType;
                    },
                  ),
                ),
              );
            },
          ),
        ),
        AppButton(
          text: AppString.saveTag,
          buttonMarginPadding: EdgeInsets.all(16.h),
        )
      ],
    ).paddingSymmetric(horizontal: 5.w);
  }
}
