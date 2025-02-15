import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/module/home/controller/home_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TournamentVideoView extends StatelessWidget {
  const TournamentVideoView({Key? key, required this.homeController}) : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: homeController.youtubePlayerController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: AppColors.primaryColor,
      // progressColors: const ProgressBarColors(
      //   playedColor: Colors.amber,
      //   handleColor: Colors.amberAccent,
      // ),
      onReady: () {
        homeController.youtubePlayerController.addListener(listenVideoViewEvent);
      },
    );
  }

  void listenVideoViewEvent() {
    print("listenVideoViewEvent call");
  }
}
