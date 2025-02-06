import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/auth/presentation/create_account_screen.dart';
import 'package:playmaster_ui/module/auth/presentation/login_screen.dart';
import 'package:playmaster_ui/module/dashboard/dashboard.dart';
import 'package:playmaster_ui/module/splash/presentation/splash_screen.dart';

mixin AppRoutes {
  static const defaultTransition = Transition.rightToLeft;
  static const String splash = '/splashScreen';
  static const String createAccountScreen = '/createAccountScreen';
  static const String loginScreen = '/loginScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String homeScreen = '/homeScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage<dynamic>(
      name: createAccountScreen,
      page: () => CreateAccountScreen(),
      transition: Transition.fade,
    ),
    GetPage<dynamic>(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.fade,
    ),
    GetPage<dynamic>(
      name: dashboardScreen,
      page: () => DashBoardScreen(),
      transition: Transition.fade,
    ),
  ];
}
