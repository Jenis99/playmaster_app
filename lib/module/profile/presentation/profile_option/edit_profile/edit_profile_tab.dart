import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';
import 'package:playmaster_ui/module/home/home.dart';
import 'package:playmaster_ui/module/profile/profile.dart';

class EditProfileTab extends StatelessWidget {
  const EditProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.h.verticalSpace,

          /// Enter username
          AuthTextFieldWithLabel(
            isUsername: true,
            isEmailField: false,
            isPasswordField: false,
            isTapOutsideEnable: true,
            labelName: AppString.usernameTag,
            hintText: AppString.enterUsername,
            textFieldClr: AppColors.grey900Color2,
            textFieldController: TextEditingController(),
          ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),

          /// Enter username
          AuthTextFieldWithLabel(
            textFieldController: TextEditingController(text: AppString.bioDetail),
            hintText: AppString.bioTag,
            labelName: AppString.bioTag,
            textFieldClr: AppColors.grey900Color2,
            isTapOutsideEnable: true,
          ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),

          TournamentTitle(
            title: AppString.favouriteGame,
            subTitle: AppString.editTag,
            onViewAll: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.grey900Color2,
                builder: (context) {
                  return FavouriteGameBottomView();
                },
              );
            },
            subtitleFontSize: 14.sp,
            subtitleFontWeight: FontWeight.w600,
            titleFontSize: 14.sp,
            titleColor: AppColors.grey400Color,
          ).paddingOnly(top: 30.h, bottom: 24.h, left: 16.w, right: 16.w),
          favouriteGameList(),
        ],
      ),
    );
  }

  Widget favouriteGameList() {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        itemCount: HomeController.find.gameList.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImg(
                imgPath: HomeController.find.gameList[index].gameImg ?? "",
                imgWidth: 80.w,
                imgHeight: 100.h,
                borderRadius: 4.r,
              ),
              16.h.verticalSpace,
              AppText(text: (HomeController.find.gameList[index].gameName ?? "").split(" ").first)
            ],
          ).paddingOnly(left: index == 0 ? 0 : 12.w, right: index == (HomeController.find.gameList.length - 1) ? 0 : 12.w);
        },
      ),
    );
  }
}
