import 'package:playmaster_ui/dependency.dart';

class FriendsDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController friendDetailTabController;
  RxInt selectedFriendsDetailTabIndex = 0.obs;
  RxBool isRequested = false.obs;

  @override
  void onInit() {
    friendDetailTabController = TabController(vsync: this, length: 3, initialIndex: 0);
    listenTabController();
    super.onInit();
  }

  @override
  void onClose() {
    friendDetailTabController.removeListener(() {
      print("Listener is removed");
    });
    super.onClose();
  }

  void listenTabController() {
    friendDetailTabController.addListener(() {
      selectedFriendsDetailTabIndex.value = friendDetailTabController.index;
    });
  }

  void onTabChange(int index) {
    friendDetailTabController.animateTo(index);
    selectedFriendsDetailTabIndex(index);
  }
}
