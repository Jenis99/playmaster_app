import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/controller/home_controller.dart';
import 'package:playmaster_ui/module/home/widget/game_card.dart';
import 'package:playmaster_ui/widgets/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: SingleChildScrollView(
              child: Row(
                children: List.generate(
                    homeController.gameList.length,
                    (index) => GameCard(
                          gameModel: homeController.gameList[index],
                        ).paddingSymmetric(horizontal: 10.w)),
              ),
            ),
          ),
          // ListView.builder(
          //   itemBuilder: (context, index) => GameCard(),
          //   itemCount: 5,
          //   shrinkWrap: true,
          //   scrollDirection: Axis.horizontal,
          // )
        ],
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: AppColors.appBackgroundClr,
      title: Row(
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
      automaticallyImplyLeading: false,
    );
  }
}
