import 'package:playmaster_ui/dependency.dart';

class MyMatchesController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController matchTabController;
  RxInt selectedMatchTabIndex = 0.obs;

  @override
  void onInit() {
    matchTabController = TabController(vsync: this, length: 3);
    listenTabController();
    super.onInit();
  }

  @override
  void onClose() {
    matchTabController.removeListener(() {
      print("Listener is removed");
    });
    super.onClose();
  }

  void listenTabController() {
    matchTabController.addListener(() {
      print("Listener called old value ${matchTabController.index} ::: ${selectedMatchTabIndex.value}");
      selectedMatchTabIndex.value = matchTabController.index;
      print("Listener called updates ${matchTabController.index} ::: ${selectedMatchTabIndex.value}");
    });
  }

  void onTabChange(int index) {
    matchTabController.animateTo(index);
    selectedMatchTabIndex(index);
  }
}
