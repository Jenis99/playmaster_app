import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: "AppString.loadingTag.toUpperCase()",
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
            fontStyle: FontStyle.italic,
            fontSize: 12.sp,
          ),
          12.h.verticalSpace,
          LinearProgressIndicator(
            color: AppColors.whiteColor,
          ).paddingSymmetric(horizontal: 40.w)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.getStartedBgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AppText(
            text: AppString.appName.toUpperCase(),
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            fontStyle: FontStyle.italic,
            fontSize: 44.sp,
          ),
        ),
      ),
    );
  }
}
