import 'package:xpressfly_app/dependency.dart';
import 'package:xpressfly_app/module/get_start/presentation/get_started_screen.dart';
import 'package:xpressfly_app/module/home/presentation/home_screen.dart';
import 'package:xpressfly_app/module/splash/presentation/splash_screen.dart';

mixin AppRoutes {
  static const defaultTransition = Transition.rightToLeft;
  static const String splash = '/splashScreen';
  static const String getStartedScreen = '/getStartedScreen';
  static const String homeScreen = '/homeScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage<dynamic>(
      name: getStartedScreen,
      transition: Transition.fade,
      page: () => GetStartedScreen(),
    ),
    GetPage<dynamic>(
      name: homeScreen,
      transition: Transition.fade,
      page: () => HomeScreen(),
    ),
  ];
}
