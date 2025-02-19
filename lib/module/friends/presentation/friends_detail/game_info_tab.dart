import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class GameInfoTab extends StatelessWidget {
  const GameInfoTab({Key? key, this.isFromExploreFriend = false}) : super(key: key);

  final bool isFromExploreFriend;

  @override
  Widget build(BuildContext context) {
    return isFromExploreFriend
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 40.sp,
                color: AppColors.grey500Color,
              ),
              13.h.verticalSpace,
              AppText(
                text: """Follow account to \n view player’s details""",
                textAlign: TextAlign.center,
              )
            ],
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            separatorBuilder: (context, index) => AppDivider(height: 0, color: AppColors.grey700Color),
            itemCount: HomeController.find.gameList.length,
            itemBuilder: (context, index) {
              final data = HomeController.find.gameList[index];
              return UserTile(
                tileColor: AppColors.transparentClr,
                isMyProfileData: true,
                playerID: "WY8737H73V",
                userData: (profileImg: data.gameImg ?? "", userId: data.gameName ?? "", username: data.gameName ?? ""),
              );
            },
          );
  }
}
