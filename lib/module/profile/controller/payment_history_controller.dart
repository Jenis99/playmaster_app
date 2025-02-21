import 'package:playmaster_ui/dependency.dart';

class PaymentHistoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController paymentHisTabController;
  RxInt selectedPaymentHistoryTab = 0.obs;

  @override
  void onInit() {
    paymentHisTabController = TabController(vsync: this, length: 3);
    listenTabController();
    super.onInit();
  }

  @override
  void onClose() {
    paymentHisTabController.removeListener(() {
      print("Listener is removed");
    });
    super.onClose();
  }

  void listenTabController() {
    paymentHisTabController.addListener(() {
      selectedPaymentHistoryTab.value = paymentHisTabController.index;
    });
  }

  void onTabChange(int index) {
    paymentHisTabController.animateTo(index);
    selectedPaymentHistoryTab(index);
  }
}
