import 'package:playmaster_ui/dependency.dart';
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
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return JoinedPlayerTile(
                userData: homeController.joinedPlayerList[index],
                tileColor: AppColors.transparentClr,
                onTap: () {
                  Get.snackbar(
                    "Coming soon",
                    "This section is under development.",
                    colorText: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                    icon: const Icon(Icons.add_alert),
                  );
                  // Get.showSnackbar(GetSnackBar(titleText: AppText(text: "Coming soon",),));
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
