import 'package:playmaster_ui/dependency.dart';

class PrizePoolTile extends StatelessWidget {
  const PrizePoolTile({super.key, required this.icon, required this.title, required this.price});

  final String icon;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      leading: CachedNetworkImg(
        imgPath: icon,
        isAssetImg: true,
        imgSize: 32.h,
      ),
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      title: AppText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      subtitle: AppText(
        text: price,
        fontSize: 14.sp,
        color: AppColors.greenClr,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
