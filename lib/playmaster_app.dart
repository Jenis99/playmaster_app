import 'dependency.dart';

class PlaymasterApp extends StatelessWidget {
  const PlaymasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(AppConstants.appScreenWidth, AppConstants.appScreenHeight),
      child: GetMaterialApp(
        enableLog: true,
        title: AppString.appName,
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.splash,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: AppString.montserratFont,
          splashColor: AppColors.transparentClr,
          disabledColor: AppColors.transparentClr,
          highlightColor: AppColors.transparentClr,
          scaffoldBackgroundColor: AppColors.appBackgroundClr,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.appBackgroundClr),
        ),
        initialBinding: AppBinding(),
        builder: (context, child) => Scaffold(
          body: child,
        ),
      ),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {}
}
