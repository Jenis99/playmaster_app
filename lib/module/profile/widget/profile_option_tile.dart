import 'package:playmaster_ui/dependency.dart';

class ProfileOptionTile extends StatelessWidget {
  ProfileOptionTile(
      {Key? key,
      required this.imagePath,
      required this.titleName,
      this.onTap,
      this.tileColor = AppColors.grey900Color2,
      this.titleTextColor = AppColors.whiteColor})
      : super(key: key);

  final String imagePath;
  final String titleName;
  final Color tileColor;
  final Color titleTextColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AppText(
        text: titleName,
        fontSize: 14.sp,
        color: titleTextColor,
        fontWeight: FontWeight.w500,
      ),
      tileColor: tileColor,
      contentPadding: EdgeInsets.zero,
      minTileHeight: 50.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: CachedNetworkImg(
          imgSize: 18.h,
          imgPath: imagePath,
          isAssetImg: true,
        ),
      ),
    ).paddingSymmetric(vertical: 4.h);
  }
}
