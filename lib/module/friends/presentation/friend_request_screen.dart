import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        titleText: "Friend requests",
        isShowWallet: false,
        isAppLogo: false,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding, vertical: 10.h),
        itemCount: Get.find<HomeController>().joinedPlayerList.length,
        itemBuilder: (context, index) => UserTile(
          userData: Get.find<HomeController>().joinedPlayerList[index],
          tileColor: AppColors.transparentClr,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                text: AppString.confirmTag,
                width: 80.w,
                height: 35.h,
                fontWeight: FontWeight.w500,
                buttonColor: AppColors.blue700Clr,
              ),
              5.w.horizontalSpace,
              Container(
                padding: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  color: AppColors.grey800Color,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Icon(Icons.clear),
              )
            ],
          ),
        ),
      ),
    );
  }
}
