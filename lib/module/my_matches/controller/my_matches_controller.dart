import 'package:playmaster_ui/dependency.dart';

class MyMatchesController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController matchTabController;
  RxInt selectedMatchTabIndex = 0.obs;

  @override
  void onInit() {
    matchTabController = TabController(vsync: this, length: 3);
    super.onInit();
  }

  void listenTabController() {
    matchTabController.addListener(() {
      selectedMatchTabIndex.value = matchTabController.index;
    });
  }

  void onTabChange(int index) {
    matchTabController.animateTo(index);
    selectedMatchTabIndex(index);
  }
}
