// import 'package:device_preview/device_preview.dart';

import 'dependency.dart';

class PlaymasterApp extends StatelessWidget {
  const PlaymasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(AppConstants.appScreenWidth, AppConstants.appScreenHeight),
      child: GetMaterialApp(
        enableLog: true,
        title: AppString.appName,
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.splash,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: AppString.montserratFont,
            splashColor: AppColors.transparentClr,
            disabledColor: AppColors.transparentClr,
            highlightColor: AppColors.transparentClr,
            scaffoldBackgroundColor: AppColors.appBackgroundClr,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.appBackgroundClr),
            textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.primaryColor)),
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
