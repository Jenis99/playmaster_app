import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/profile/controller/payment_history_controller.dart';

class PaymentCategoryView extends StatelessWidget {
  PaymentCategoryView({Key? key}) : super(key: key);

  final PaymentHistoryController paymentHistoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gameCategoryBox(),
        Container(
          color: AppColors.grey900Color2,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: AppText(
            text: "Sep 2024",
            color: AppColors.grey400Color,
          ),
        ),
        ListView.separated(
          itemBuilder: (context, index) => commonPaymentTile(),
          separatorBuilder: (context, index) => AppDivider(color: AppColors.grey800Color).paddingSymmetric(horizontal: 16.w),
          itemCount: 5,
          shrinkWrap: true,
        ),
        // commonPaymentTile()
      ],
    );
  }

  ListTile commonPaymentTile() {
    return ListTile(
      // tileColor: Colors.red,
      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: AppText(
        text: "Valorant - Unrank Medium Pool",
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: "ID: YDWI7Y37FUHHQ983",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400Color,
          ),
          AppText(
            text: "23 Sep 2024",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400Color,
          ),
        ],
      ),
      trailing: AppText(
        text: "-₹499",
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.grey400Color,
      ),
    );
  }

  /// Game category
  Widget gameCategoryBox({String? gameType, int? index}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          paymentHistoryController.paymentCategoryList.length,
          (index) {
            return GestureDetector(
              onTap: () {},
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
}
