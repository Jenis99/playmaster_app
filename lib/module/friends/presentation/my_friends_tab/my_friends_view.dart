import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/friends/friends.dart';
import 'package:playmaster_ui/module/home/home.dart';

class MyFriendsView extends StatelessWidget {
  MyFriendsView({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: homeController.joinedPlayerList.length,
            separatorBuilder: (context, index) => AppDivider(
              height: 1.h,
              color: AppColors.grey700Color,
            ),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return UserTile(
                userData: homeController.joinedPlayerList[index],
                tileColor: AppColors.transparentClr,
                onTap: () {
                  Navigation.rightToLeft(FriendsDetailScreen(
                    friendName: homeController.joinedPlayerList[index].username,
                    isFromMyFriends: true,
                  ));
                },
                trailingIconClr: AppColors.grey400Color,
              );
            },
          ),
        )
      ],
    );
  }
}
