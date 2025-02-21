import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/presentation/edit_profile_game_info_tab.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  final EditProfileController editProfileController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        appbarBgClr: AppColors.grey900Color2,
        titleText: AppString.editProfile,
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
                    controller: editProfileController.profileTabController,
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
                          title: AppString.profile,
                          onTap: editProfileController.onTabChange,
                          selectedIndex: editProfileController.selectedProfileTab.value,
                        ),
                      ),
                      Obx(
                        () => CommonTabBarElement(
                            index: 1,
                            title: AppString.gameInfo,
                            onTap: editProfileController.onTabChange,
                            selectedIndex: editProfileController.selectedProfileTab.value),
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
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: editProfileController.profileTabController,
                    children: [EditProfileTab(), EditProfileGameInfoTab()],
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
