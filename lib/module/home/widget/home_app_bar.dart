import 'package:playmaster_ui/dependency.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.isAppLogo = true, this.titleText = "", this.appbarBgClr, this.isShowWallet = true});

  final bool isAppLogo;
  final bool isShowWallet;
  final String titleText;
  final Color? appbarBgClr;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.transparentClr,
      centerTitle: false,
      titleSpacing: isAppLogo ? 16.w : 0,
      backgroundColor: appbarBgClr ?? AppColors.appBackgroundClr,
      title: isAppLogo
          ? Row(
              children: [
                CachedNetworkImg(
                  imgPath: AppAssets.appLogo,
                  imgSize: 24.h,
                  isAssetImg: true,
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
        if (isShowWallet)
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppConstants.appHorizontalPadding),
            decoration: BoxDecoration(
              color: AppColors.grey800Color,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            child: Row(
              children: [
                AppText(
                  text: "₹ 2000",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ).paddingOnly(
                  top: 4.h,
                  bottom: 4.h,
                  left: 12.w,
                ),
                12.w.horizontalSpace,
                CachedNetworkImg(
                  imgPath: AppAssets.walletIcon,
                  imgSize: 28.h,
                  isAssetImg: true,
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
