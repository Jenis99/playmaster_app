import 'package:playmaster_ui/dependency.dart';

class PrizePoolTile extends StatelessWidget {
  const PrizePoolTile({super.key, required this.icon, required this.title, required this.price});

  final String icon;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImg(
          imgPath: icon,
          isAssetImg: true,
          imgSize: 32.h,
        ),
        16.w.horizontalSpace,
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            4.h.horizontalSpace,
            AppText(
              text: price,
              fontSize: 14.sp,
              color: AppColors.greenClr,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    ).paddingSymmetric(vertical: 4.h);
  }
}
