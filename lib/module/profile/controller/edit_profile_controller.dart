import 'package:playmaster_ui/dependency.dart';

class EditProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController profileTabController;
  RxInt selectedProfileTab = 0.obs;

  @override
  void onInit() {
    profileTabController = TabController(vsync: this, length: 2, initialIndex: 0);
    listenTabController();
    super.onInit();
  }

  @override
  void onClose() {
    profileTabController.removeListener(() {
      print("Listener is removed");
    });
    super.onClose();
  }

  void listenTabController() {
    profileTabController.addListener(() {
      selectedProfileTab.value = profileTabController.index;
    });
  }

  void onTabChange(int index) {
    profileTabController.animateTo(index);
    selectedProfileTab(index);
  }

  List<({String title, TextEditingController textEditingController})> gameInfoList = [
    (title: AppString.valorantGame, textEditingController: TextEditingController()),
    (title: AppString.bGMIGame, textEditingController: TextEditingController()),
    (title: AppString.fallGuys, textEditingController: TextEditingController()),
    (title: AppString.freeFire, textEditingController: TextEditingController()),
    (title: AppString.csgoTag, textEditingController: TextEditingController()),
    (title: AppString.codTag, textEditingController: TextEditingController()),
    (title: AppString.rocketLeague, textEditingController: TextEditingController()),
    (title: AppString.fortnight, textEditingController: TextEditingController()),
    (title: AppString.stumbleGuys, textEditingController: TextEditingController()),
    (title: AppString.battleStar, textEditingController: TextEditingController()),
    (title: AppString.miniMilitia, textEditingController: TextEditingController()),
  ];
}
