import 'package:playmaster_ui/dependency.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    super.onInit();
  }

  void onTabChange(int index) {
    tabController.animateTo(index);
    selectedTabIndex(index);
  }
}
