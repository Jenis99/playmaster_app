import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class DetailAboutTab extends StatelessWidget {
  DetailAboutTab({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: AppString.favouriteGame,
          color: AppColors.grey400Color,
          fontSize: 14.sp,
        ).paddingOnly(top: 30.h, bottom: 12.h, left: 16.w),
        favouriteGameList(),
        AppText(
          text: AppString.bioTag,
          color: AppColors.grey400Color,
          fontSize: 14.sp,
        ).paddingOnly(top: 30.h, bottom: 12.h, left: 16.w),
        AppText(
          fontSize: 14.sp,
          color: AppColors.whiteColor,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: AppString.bioDetail,
        ).paddingOnly(
          // top: 30.h,
          // bottom: 12.h,
          left: 16.w,
          right: 16.w,
        ),
      ],
    );
  }

  Widget favouriteGameList() {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
          itemCount: homeController.gameList.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImg(
                  imgPath: homeController.gameList[index].gameImg ?? "",
                  imgWidth: 80.w,
                  imgHeight: 100.h,
                  borderRadius: 4.r,
                ),
                16.h.verticalSpace,
                AppText(text: (homeController.gameList[index].gameName ?? "").split(" ").first)
              ],
            ).paddingOnly(left: index == 0 ? 0 : 12.w, right: index == (homeController.gameList.length - 1) ? 0 : 12.w);
          }),
    );
  }
}
