import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/controller/home_controller.dart';
import 'package:playmaster_ui/module/my_matches/my_matches.dart';

class LiveTournamentScreen extends StatelessWidget {
  LiveTournamentScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            homeController.lastGameModelList.length,
            (index) => MyMatchTile(
                  selectedIndex: 1,
                  lastMinGameModel: homeController.lastGameModelList[index],
                )),
      ).paddingAll(16.h),
    );
  }
}
