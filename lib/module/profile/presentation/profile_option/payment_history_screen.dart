import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/controller/payment_history_controller.dart';
import 'package:playmaster_ui/module/profile/widget/payment_filter_view.dart';

class PaymentHistoryScreen extends StatelessWidget {
  PaymentHistoryScreen({Key? key}) : super(key: key);

  final PaymentHistoryController paymentHistoryController = Get.put(PaymentHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        appbarBgClr: AppColors.grey900Color2,
        titleText: AppString.paymentHistory,
        isAppLogo: false,
        isShowWallet: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.verticalSpace,
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.appBackgroundClr,
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: paymentHistoryController.paymentHisTabController,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 0,
                    indicator: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppAssets.myMatchesShadow), fit: BoxFit.fill),
                    ),
                    tabs: [
                      Obx(
                        () => CommonTabBarElement(
                          index: 0,
                          title: AppString.contests,
                          onTap: paymentHistoryController.onTabChange,
                          selectedIndex: paymentHistoryController.selectedPaymentHistoryTab.value,
                        ),
                      ),
                      Obx(
                        () => CommonTabBarElement(
                            index: 1,
                            title: AppString.withdrawal,
                            onTap: paymentHistoryController.onTabChange,
                            selectedIndex: paymentHistoryController.selectedPaymentHistoryTab.value),
                      ),
                      Obx(
                        () => CommonTabBarElement(
                            index: 2,
                            title: AppString.deposits,
                            onTap: paymentHistoryController.onTabChange,
                            selectedIndex: paymentHistoryController.selectedPaymentHistoryTab.value),
                      ),
                    ],
                  ),
                ),
                AppDivider(
                  height: 1,
                  color: AppColors.grey700Color,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: paymentHistoryController.paymentHisTabController,
                    children: [
                      PaymentSubTabView(currentTab: 0),
                      PaymentSubTabView(currentTab: 1),
                      PaymentSubTabView(currentTab: 2),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
