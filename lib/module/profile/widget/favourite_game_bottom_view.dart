import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class FavouriteGameBottomView extends StatelessWidget {
  const FavouriteGameBottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
