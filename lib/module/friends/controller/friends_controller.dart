import 'package:playmaster_ui/dependency.dart';

class FriendsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController friendsTabController;
  RxInt selectedFriendsTabIndex = 0.obs;
  TextEditingController exploreFriendsController = TextEditingController();

  @override
  void onInit() {
    friendsTabController = TabController(vsync: this, length: 2, initialIndex: 0);
    listenTabController();
    super.onInit();
  }

  @override
  void onClose() {
    friendsTabController.removeListener(() {
      print("Listener is removed");
    });
    super.onClose();
  }

  void listenTabController() {
    friendsTabController.addListener(() {
      selectedFriendsTabIndex.value = friendsTabController.index;
    });
  }

  void onTabChange(int index) {
    friendsTabController.animateTo(index);
    selectedFriendsTabIndex(index);
  }
}
