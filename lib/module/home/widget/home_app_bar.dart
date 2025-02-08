import 'package:playmaster_ui/dependency.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.isAppLogo = true, this.titleText = ""});

  final bool isAppLogo;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBackgroundClr,
      title: isAppLogo
          ? Row(
              children: [
                Image.asset(
                  AppAssets.appLogo,
                  height: 24.h,
                  width: 24.h,
                ),
                GradientText(
                  gradient: LinearGradient(colors: AppColors.appNameTextGradient),
                  child: AppText(
                    text: AppString.appName.toUpperCase(),
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            )
          : AppText(
              text: titleText,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          decoration: BoxDecoration(
            color: AppColors.grey800Color,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              AppText(
                text: "2000",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ).paddingOnly(
                top: 4.h,
                bottom: 4.h,
                left: 12.w,
              ),
              12.w.horizontalSpace,
              Image.asset(
                AppAssets.walletIcon,
                height: 28.h,
                width: 28.h,
              )
            ],
          ),
        )
      ],
      automaticallyImplyLeading: !isAppLogo,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// return const Placeholder();
}
