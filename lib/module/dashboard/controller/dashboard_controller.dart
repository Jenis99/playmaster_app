import 'package:playmaster_ui/dependency.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt selectedTabIndex = (-1).obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    listenTabController();
    super.onInit();
  }

  void listenTabController() {
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
  }

  void onTabChange(int index) {
    tabController.animateTo(index);
    selectedTabIndex(index);
  }
}
