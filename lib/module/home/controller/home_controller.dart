import 'package:carousel_slider/carousel_controller.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  RxInt currentCarousel = 0.obs;
  RxBool isShowAddBalance = false.obs;
  RxBool isVideoPlaying = false.obs;

  static HomeController get find => Get.isRegistered<HomeController>() ? Get.find() : Get.put(HomeController());

  // late VideoPlayerController videoController;
  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: 'IX2Emps0al4',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      isLive: true,
      mute: false,
    ),
  );

  /// Home detail view
  RxInt selectedGameType = 0.obs;
  List<String> gameType = ["All Category", "Unrated", "Deathmatch", "Team Deathmatch"];
  RxString selectedGameStartTime = "".obs;
  List<String> gameStartTimeList = ["Any time", "1 hour", "2 hour", "5 hour", "1 day", "2 day", "3 day"];
  RxString selectedPoolSize = "All Size".obs;
  RxString selectedStartTime = "Any time".obs;

  List<({String icon, String name, String price})> rankPriceList = [
    (icon: AppAssets.firstIcon, name: "1st Rank", price: "₹6,000"),
    (icon: AppAssets.secondIcon, name: "2nd Rank", price: "₹2,000"),
    (icon: AppAssets.thirdIcon, name: "3rd Rank", price: "₹1,000"),
    (icon: AppAssets.fourthIcon, name: "4th Rank", price: "₹500"),
  ];
  List<({String label, String name})> gamePoolSize = [
    (label: "All Size", name: "All"),
    (label: "Small Pool", name: "Small"),
    (label: "Medium Pool", name: "Medium"),
    (label: "Big Pool", name: "Big"),
  ];
  List<({String profileImg, String username, String userId})> joinedPlayerList = [
    (profileImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg", username: "Rickey Lueilwitz", userId: "@rickey_99"),
    (
      profileImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
      username: "Christian Berge",
      userId: "@berge_christian",
    ),
    (
      profileImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
      username: "Angie Hegmann",
      userId: "@angie_h44",
    ),
    (profileImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg", username: "Bryan Cruickshank", userId: "@bryan_hunter"),
    (profileImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg", username: "Darryl Mills", userId: "@darryl_sniper"),
  ];

  List<GameModel> gameList = [
    GameModel(
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
  ];

  List<TopGameModel> topGameList = [
    TopGameModel(
        gameName: "Valorant",
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        tournamentCount: 124,
        isGameSelected: false.obs,
        gameType: GameType.pcGame),
    TopGameModel(
        gameName: "BGMI",
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        tournamentCount: 146,
        isGameSelected: false.obs,
        gameType: GameType.mobileGame),
    TopGameModel(
      gameName: "Fall Guys",
      gameImg: "https://images.alphacoders.com/125/1250770.jpg",
      tournamentCount: 76,
      isGameSelected: false.obs,
      gameType: GameType.pcGame,
    ),
    TopGameModel(
      gameName: "Free Fire",
      gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
      tournamentCount: 146,
      isGameSelected: false.obs,
      gameType: GameType.mobileGame,
    ),
    TopGameModel(
        gameName: "Valorant",
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        tournamentCount: 124,
        isGameSelected: false.obs,
        gameType: GameType.pcGame),
    TopGameModel(
        gameName: "BGMI",
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        tournamentCount: 146,
        isGameSelected: false.obs,
        gameType: GameType.mobileGame),
    TopGameModel(
      gameName: "Fall Guys",
      gameImg: "https://images.alphacoders.com/125/1250770.jpg",
      tournamentCount: 76,
      isGameSelected: false.obs,
      gameType: GameType.pcGame,
    ),
    TopGameModel(
      gameName: "Free Fire",
      gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
      tournamentCount: 146,
      isGameSelected: false.obs,
      gameType: GameType.mobileGame,
    ),
  ];

  List<LastMinGameModel> lastGameModelList = [
    LastMinGameModel(
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        gameName: "Valorant - Unrank Medium Pool",
        availableSlot: 1,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 600,
        gameType: GameType.pcGame,
        pricePool: 1000,
        totalSlot: 2,
        gameFee: "₹ 500 entry fee",
        tournamentStatus: TournamentStatus.completed,
        slotPercentage: 50),
    LastMinGameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "BGMI - Erangel Map (Single) Big Pool",
        availableSlot: 85,
        startTime: "Start at 12 Jun, 10:00pm",
        gameType: GameType.mobileGame,
        pricePerTeam: 550,
        pricePool: 10000,
        totalSlot: 100,
        gameFee: "₹ 500 entry fee",
        tournamentStatus: TournamentStatus.live,
        slotPercentage: 80),
    LastMinGameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "Fall guys - Small pool match",
        availableSlot: 35,
        startTime: "Start at 12 Jun, 10:00pm",
        gameType: GameType.pcGame,
        pricePerTeam: 50,
        pricePool: 500,
        tournamentStatus: TournamentStatus.live,
        totalSlot: 50,
        gameFee: "₹ 500 entry fee",
        slotPercentage: 50),
    LastMinGameModel(
        gameImg: "https://wallpapers.com/images/featured/valorant-305kescxw5dpup7y.jpg",
        gameName: "Valorant - Unrank Medium Pool",
        availableSlot: 1,
        tournamentStatus: TournamentStatus.live,
        gameType: GameType.pcGame,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 600,
        gameFee: "₹ 500 entry fee",
        pricePool: 1000,
        totalSlot: 2,
        slotPercentage: 50),
    LastMinGameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "BGMI - Erangel Map (Single) Big Pool",
        availableSlot: 85,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 550,
        tournamentStatus: TournamentStatus.live,
        gameType: GameType.mobileGame,
        pricePool: 10000,
        gameFee: "₹ 500 entry fee",
        totalSlot: 100,
        slotPercentage: 70),
    LastMinGameModel(
        gameImg: "https://www.exhibit.tech/wp-content/uploads/2023/05/desktop-wallpaper-100-best-bgmi-names-for-new-version-of-pubg-bgmi-pubg.jpg",
        gameName: "Fall guys - Small pool match",
        availableSlot: 35,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 80,
        pricePool: 500,
        tournamentStatus: TournamentStatus.joined,
        gameType: GameType.pcGame,
        gameFee: "₹ 500 entry fee",
        totalSlot: 35,
        slotPercentage: 90)
  ];
}
