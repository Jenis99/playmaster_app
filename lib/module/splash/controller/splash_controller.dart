import 'package:xpressfly_app/dependency.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startTimeOut();
    super.onInit();
  }

  void startTimeOut() {
    // Future.delayed(const Duration(seconds: 2), () => Navigation.pushNamed(AppRoutes.createAccountScreen));
  }
}
