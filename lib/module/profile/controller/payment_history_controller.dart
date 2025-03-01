import 'package:playmaster_ui/dependency.dart';

class PaymentHistoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController paymentHisTabController;
  Rx<GamePlatformType> selectedGameType = GamePlatformType.allGames.obs;
  Rx<TransactionStatus> selectedTransaction = TransactionStatus.allType.obs;
  RxInt selectedPaymentHistoryTab = 0.obs;
  final List<String> paymentCategoryList = ["Date of Transaction", "Transaction Status", "Game Platform"];

  final List<TransactionStatus> transactionStatusList = [
    TransactionStatus.allType,
    TransactionStatus.successfully,
    TransactionStatus.failed,
    TransactionStatus.pending
  ];
  final List<GamePlatformType> gamePlatformList = [
    GamePlatformType.allGames,
    GamePlatformType.mobileGame,
    GamePlatformType.pcGames,
  ];
  final List<({String gameName, int dateOfTransaction, String amount, String id})> paymentList = [
    (gameName: "Valorant - Unrank Medium Pool", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1727116200000),
    (gameName: "BGMI - Erangel Map (Single) Big Pool", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1726770600000),
    (gameName: "Valorant - Unrank Medium Pool", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1716143400000),
    (gameName: "Fall guys - Small pool match", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1716143400000),
    (gameName: "Valorant - Unrank Medium Pool", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1716143400000),
    (gameName: "Valorant - Unrank Medium Pool", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1724092200000),
    (gameName: "Fall guys - Small pool match", id: "YDWI7Y37FUHHQ983", amount: "₹499", dateOfTransaction: 1716143400000),
  ];

  @override
  void onInit() {
    paymentHisTabController = TabController(vsync: this, length: 3, initialIndex: 0);
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
