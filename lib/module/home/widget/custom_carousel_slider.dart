import 'package:carousel_slider/carousel_slider.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/home.dart';

class GameCarouselView extends StatefulWidget {
  const GameCarouselView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<GameCarouselView> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: homeController.gameList.map((gameModel) => GameCard(gameModel: gameModel)).toList(),
          carouselController: homeController.carouselSliderController,
          options: CarouselOptions(
              autoPlay: false,
              padEnds: false,
              enableInfiniteScroll: false,
              viewportFraction: .78,
              height: Get.height * 0.32,
              onPageChanged: (index, reason) {
                homeController.currentCarousel.value = index;
              }),
        ),
        16.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeController.gameList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => homeController.carouselSliderController.animateToPage(entry.key),
              child: Obx(
                () => Container(
                    width: 16.0.w,
                    height: 4.0.h,
                    margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: homeController.currentCarousel.value == entry.key ? AppColors.redColor : AppColors.grey700Color)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
