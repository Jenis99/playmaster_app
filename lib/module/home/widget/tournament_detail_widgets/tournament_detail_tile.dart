import 'package:playmaster_ui/dependency.dart';

class TournamentDetailTile extends StatelessWidget {
  const TournamentDetailTile({super.key, required this.icon, required this.title, this.subtitle = ""});

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImg(
          imgPath: icon,
          isAssetImg: true,
          imgSize: 16.h,
        ),
        8.w.horizontalSpace,
        AppText(
          text: title,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        if (subtitle.isNotEmpty)
          AppText(
            text: subtitle,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: AppColors.grey300Color,
          ),
      ],
    );
  }
}
