import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/auth.dart';
import 'package:playmaster_ui/module/home/home.dart';

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
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Title
                      Container(
                        height: 4.h,
                        width: 50.h,
                        margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.grey700Color,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      TournamentTitle(
                        title: AppString.favouriteGame,
                        subTitle: AppString.cancelTag,
                        onViewAll: () => Navigation.pop(),
                      ).paddingSymmetric(horizontal: AppConstants.appHorizontalPadding),
                      20.h.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          itemCount: HomeController.find.topGameList.length,
                          itemBuilder: (context, index) {
                            TopGameModel gameModelData = HomeController.find.topGameList[index];
                            return Obx(
                              () => Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                  image: (HomeController.find.topGameList[index].isGameSelected?.isTrue ?? false)
                                      ? DecorationImage(image: AssetImage(AppAssets.bottomSheetShadow), fit: BoxFit.fill)
                                      : null,
                                  color: AppColors.grey900Color2,
                                ),
                                child: UserTile(
                                  onTap: () {
                                    HomeController.find.topGameList[index].isGameSelected?.toggle();
                                  },
                                  isMyProfileData: true,
                                  isVerticalPadding: false,
                                  trailing: (HomeController.find.topGameList[index].isGameSelected?.isTrue ?? false) ? Icon(Icons.check) : null,
                                  subtitleText: gameModelData.gameType?.gameLabel ?? "",
                                  titleText: gameModelData.gameName ?? "",
                                  profileImg: gameModelData.gameImg ?? "",
                                ).paddingSymmetric(horizontal: 16.w),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
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
          }),
    );
  }
}
