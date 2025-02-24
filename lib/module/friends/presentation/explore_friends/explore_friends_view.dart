import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';

class ExploreFriendsView extends StatelessWidget {
  ExploreFriendsView({Key? key}) : super(key: key);

  final FriendsController friendsController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchField(),
        Expanded(
          child: ListView.separated(
            itemCount: homeController.joinedPlayerList.length,
            separatorBuilder: (context, index) => AppDivider(
              height: 1.h,
              color: AppColors.grey700Color,
            ),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final userdata = homeController.joinedPlayerList[index];
              return UserTile(
                userData: userdata,
                tileColor: AppColors.transparentClr,
                onTap: () {
                  Navigation.rightToLeft(FriendsDetailScreen(
                    friendName: userdata.username,
                    isFromMyFriends: false,
                  ));
                },
                trailingIconClr: AppColors.grey400Color,
              );
            },
          ),
        )
      ],
    ).paddingAll(AppConstants.appHorizontalPadding);
  }

  AppTextField searchField() {
    return AppTextField(
      controller: friendsController.exploreFriendsController,
      color: AppColors.grey900Color2,
      prefixIcon: CachedNetworkImg(
        imgPath: AppAssets.searchIcon,
        isAssetImg: true,
        imgSize: 20.h,
      ),
      hintText: AppString.searchFriendsHere,
      isTapOutsideEnable: true,
      isBottomPaddingApply: false,
      textFieldOrder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    );
  }
}
