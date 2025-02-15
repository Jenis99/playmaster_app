import 'package:carousel_slider/carousel_controller.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  RxInt currentCarousel = 0.obs;
  RxBool isShowAddBalance = false.obs;
  RxBool isVideoPlaying = false.obs;

  // late VideoPlayerController videoController;
  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: 'IX2Emps0al4',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      isLive: true,
      mute: false,
    ),
  );

  void initVideoController() {
    // YoutubePlayerController _controller = YoutubePlayerController(
    //   initialVideoId: 'IX2Emps0al4',
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //   ),
    // );
  }

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
    (
      profileImg:
          "https://s3-alpha-sig.figma.com/img/d50a/bc89/1f55bd7412aefcf6f5ea4006525b28f2?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FinBdluw~~bs7IHlg7ucAEBFfXVsdgMFUI505rWlxHLIAm-JvUDZ-IgT-H9gmUyX5hCiUES7BZPyqVokaQ1Nkdjkc1CwVzCMfZAo8kaBeAyd67mvQjjzZV3ezzBYDc2sdTmjlJkcGyq6eq8IGIcOgHgYQ4AncAxgpA4owMEV1cg-2r2YNVGNIIzQtb7d-zvEcFLson2OvjTC9AIwMxKPF4PQQHnek2lSf7nmFAMWFvCP3ZFrNYv4MDN3LM36bObRK-wiAPbWH~GWPO98f~88xcGX8d93ARkBKaKX7wrbgQyE9lxiRH4P9N7J~T6jLR0cOhyDVOPzhT6UFrbH7eZV~Q__",
      username: "Rickey Lueilwitz",
      userId: "@rickey_99"
    ),
    (
      profileImg:
          "https://s3-alpha-sig.figma.com/img/af3b/5a95/f6ddfcd404b078a0e25fbdc60df812a0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=BOPVBokIrAC9A7TGPgVy5ZsBMZooblVQfT~vHhfI0uVVN3pVmQhzatfZOK94HTIiHt4OX5mM-0m1BZ35jtWEhs0DQ-d5~ZvuhGFP-bG4oy0LFrFzRKIkEDyAmltBpZvHdyeRcSJZWCMe7cdoRcmgXxV1WdJDXbRa2t3nDPkkGtcvPOzLkFm-eYxCYh0tpCJLLbhXl~8ziP0xRPgjR2vvAI5l9TErRSnUZfiKLhx6MDj1tjhfuJuu5WtOxg6uIEpuZmwKx5FrasGYlACAEAKVlVUipXOsuLEzw3vxpX1aL1Czj1v5VU-4rIiuE5uuX1Y7XmEhsUpWLB0Jm2UbSUr7Vw__",
      username: "Christian Berge",
      userId: "@berge_christian",
    ),
    (
      profileImg:
          "https://s3-alpha-sig.figma.com/img/a2d4/0cad/30159fdd713b96eafeb2c75697e0aebe?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=KzA1ii0LilwiEXnbnLmnQxFcscW4r3cB19SCFzBSC15RNFzLVcVTM8ftPJq61x5cC1zw8AHsDM~4IUiB3HiSvW9z1HElL7n7YfvreUCLxEzLUuUjc2R0jI3pfMybZdBJ3Seo21U4v6DdG5vlS5Vh3LVRc06Tl0HEyGpIN8Vt0A80R6U1-DFeKlrBmoT6nIjv9DpUdIJhSu5hXv1eHbY1Jpy7OXFX~1SfNtb-VHOo7Xeb9wk3Xg5n0uArwBpne3wvBJ2zSxkDFqdytMomL8YRB2M4lbTvY0S4qIiApE6c8vXUGezfypWWvlDqrio3nScwFhrnExSKRRKLJ5wSANKwQg__",
      username: "Angie Hegmann",
      userId: "@angie_h44",
    ),
    (
      profileImg:
          "https://s3-alpha-sig.figma.com/img/cb23/2aff/cc4fc2f9e7ab5aa269e044ad10ba49b8?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dwAttuzcuCOkcBGYfMTb9YYKSPly8KhbyEmZGJ3GjvARuigL~uBPOnwgYLY0P3WlZNlKxaWfCuz31rp5Z7yKuFo9UeLAAOCDqFLusB6RBaI~avWQD~SMfFy3hUNdpB4GrpPD0UPvWZu-Vhx9JWyTvrGFYnVqinbxIY3Om4bx9QQYrs8OlMLZn8Hr-aHcHYVRarNMUoQVaDIIub6cGwcT8KaAb0hZCqkd5JMq6WuECC7seBYDfjNZqrfZ-GOnpA~KPojpRlhE2ih0OIGKe7i~ANGydMlmXYaRpKIRp3XcwSLD3yeWdlGqPjHsALoQscN5gDXxL-5zg2q7Xg0eLK3V~A__",
      username: "Bryan Cruickshank",
      userId: "@bryan_hunter"
    ),
    (
      profileImg:
          "https://s3-alpha-sig.figma.com/img/f8d1/f54d/d29f57550fc5084b619217f4b9f32680?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JOQPlU6xbZgadbUAbgouW40SP0dxtX6iFWP1g3AVnJLN1yVKJO-UtQx8Mc6ktUQmn1qpSiPiE0vSq-zpgmhvDehh4sMXiBbktcfs4iYKy2bm2oXeVG7nJW5mcpTbCI3sAjmqLQEtXmipN8bT6uh9mRVyiCg7AyFOn-FtkpTWUGFhfFdtcuQEW2TPfCevDjEU-m8u8ckbpDBgAsy~Cliq3HEqKCLtZV1xRx9Q7PM-gZ~00G0S7MJd4C1apfF8IVAY2E~XBlNfMzskSHDObmqOVYv5-9bgegWFp2iOUBjsu0DuONz4ZNHs05LWuHYY66BNO9pFyjTmfazKhPFcEDBCVg__",
      username: "Darryl Mills",
      userId: "@darryl_sniper"
    ),
  ];

  List<GameModel> gameList = [
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/2e56/c968/de09f3802ba4776ed62a7bf671b70e56?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YVIHypuUHRdi0pVrXQjRdYQf178mWggYxBQ3WxwGVEhgMqvFZqfqNhlPVwYV7-9mxf6y0AHsbqc7FbnbgTm4Z26oGIO~5eWFw4fwmWFZ~7Nal6sBBcUq-FI0g0fe18Di6DjW5hYWlY33rJnec8Cr8Kh2KLIqKaQyJVNlo2lAgCmENB9OjZFROwR6Z3KKr8N6a6foS12B~oa7wPgpbFMp6ZsNfj9hI3~vxm8yadlcoSjNc0TdWB~oJplKk2u0fzfo24dpTa1ObdNsiIqjrAPfjPCus5oh1IABrz~KRndFFQj0QrbNp2mwWx-LLleBS2PikYlNeTj0JenIIVtU-JgIaQ__",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/2e56/c968/de09f3802ba4776ed62a7bf671b70e56?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YVIHypuUHRdi0pVrXQjRdYQf178mWggYxBQ3WxwGVEhgMqvFZqfqNhlPVwYV7-9mxf6y0AHsbqc7FbnbgTm4Z26oGIO~5eWFw4fwmWFZ~7Nal6sBBcUq-FI0g0fe18Di6DjW5hYWlY33rJnec8Cr8Kh2KLIqKaQyJVNlo2lAgCmENB9OjZFROwR6Z3KKr8N6a6foS12B~oa7wPgpbFMp6ZsNfj9hI3~vxm8yadlcoSjNc0TdWB~oJplKk2u0fzfo24dpTa1ObdNsiIqjrAPfjPCus5oh1IABrz~KRndFFQj0QrbNp2mwWx-LLleBS2PikYlNeTj0JenIIVtU-JgIaQ__",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
        gameName: "Valorant - Deathmatch Big Pool",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
    GameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/2e56/c968/de09f3802ba4776ed62a7bf671b70e56?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YVIHypuUHRdi0pVrXQjRdYQf178mWggYxBQ3WxwGVEhgMqvFZqfqNhlPVwYV7-9mxf6y0AHsbqc7FbnbgTm4Z26oGIO~5eWFw4fwmWFZ~7Nal6sBBcUq-FI0g0fe18Di6DjW5hYWlY33rJnec8Cr8Kh2KLIqKaQyJVNlo2lAgCmENB9OjZFROwR6Z3KKr8N6a6foS12B~oa7wPgpbFMp6ZsNfj9hI3~vxm8yadlcoSjNc0TdWB~oJplKk2u0fzfo24dpTa1ObdNsiIqjrAPfjPCus5oh1IABrz~KRndFFQj0QrbNp2mwWx-LLleBS2PikYlNeTj0JenIIVtU-JgIaQ__",
        gameName: "BGMI",
        gameFee: "₹ 500 entry fee",
        prizePool: "10,00 Prize pool",
        startTime: "Start at 12 Jun, 10:00pm"),
  ];

  List<TopGameModel> topGameList = [
    TopGameModel(
        gameName: "Valorant",
        gameImg:
            "https://s3-alpha-sig.figma.com/img/2852/8aba/ef45eafc9f2cc02b95f440e7ab8a51ab?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=hOvYmb8qWWqwNef~WK1GgvkXcd32gCuDPOuzRwc8V6FSmUa51bujyRiZwc7M8pJhU8hz~adYGX-VCT9qfw6z-pr64I79Nv7GJ0mTchrqjXuxPwTAEHO4FuA4DtpzTcFDsXaFhcnNFvB0IfNcSegp7-T6pZ0lOndmpbbsAt5vzxKD80MZo8YBfMcNTnA7uZcd3KFfQ~rY0T~tHsdt40ksUpsFJmr9XbBrgPnrfBjaMS0jZMg6vVe~SqaVinXoyeCqHj-W-MosYfoSIhhbkO47HoBPYJ9D4RFRhyIvVv4SOyAIji4fSYwpUdIIXISFfivjBMyfPDAfWHWONH~r880zIg__",
        tournamentCount: 124,
        gameType: GameType.pcGame),
    TopGameModel(
        gameName: "BGMI",
        gameImg:
            "https://s3-alpha-sig.figma.com/img/4632/c46c/3343f65ee6ed499f213839f3848b14d2?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=IgoEkBvZtkfhLf-00wDToLBqmGFFIbBuKvy3y3V56zIr2vf2qr90EZiLVQcGMf9opyaLeM1FgZ1TIvOV54MK24Fse5h7odnL4nIlhxEPvNSD2MoAA6yctq1zuqJYPctTvBJXz4FC7RQ3yWLBonpwVpehS9gXNBKq8HYQpwpuB2efEZml2b4l3lOIXg9FxghXO~AO6feLhTqsYHJNbG0uZ6R~qzzrvCz2Yp7yI8iw3NfJt3-K~olLWudrfntoii3Mh5oYawW6tfw8yylrIEJCv0qpYZKQE2GNUg6OL1~~eZPzwMzbGqzF1b5aPzZGo7toIEHxeygcsueey-IJ-qJ8qw__",
        tournamentCount: 146,
        gameType: GameType.mobileGame),
    TopGameModel(
      gameName: "Fall Guys",
      gameImg:
          "https://s3-alpha-sig.figma.com/img/5367/b7aa/12b209310a4fdd3c2b354c87a0ec0c06?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QxqqAXK3tZeoSzRKTgadBzZ48cUICB469MKuAKh9OMnskxZG7-NakSJW~68eQUYcOBts-4V~A6ueeiw3OCANqmmL~gEIxi2QrlsJAxYgoLERFgm7Z4ApRL5II9-j4httWdzTqDpEVKaekukJ6GI7EeDaiEdxrTiuhHa8ma5ubmyI06sJt~l9lnXlTngZbFW~YJaoG0SwaJ5-hkp~EhzUcVp~R~rmXJqOPq4PobzvIUEc-kBzu1Q2JcqRnbJqxyU6TqNQIM8pU85Ka0WXHGeXDXz-YCJQ6N~XDYerS9LouzvO0A5I15-99i-mTfb2v52OuTZ0EMKAtrZqAyKhYpqVag__",
      tournamentCount: 76,
      gameType: GameType.pcGame,
    ),
    TopGameModel(
      gameName: "Free Fire",
      gameImg:
          "https://s3-alpha-sig.figma.com/img/d40e/6d59/a321bea57cb181421b0fbf80067041d2?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=goWJNosMvg9OaSMW3x9k25mYGIkKdu7pyFnuR5Awd70Y0bnnr-Q0GTKcSU~J8c0-6IfpRjKCuan1z3B1u3ZJ3iiAQ1Mc7ChAUU2MBslAQZyASdHi241fwbh24I6QY07QqRQX3RbfJ7vmYETJ5kSZro8CE2FaiJpSXzW8IKaB1eGe~5pLN0-doQj12yh8qtOTb-wBCfyNLuPxOgqFQ8RedJbDGQlUBs7FKnNQ5sMlSPqSwBuqmvl~nsmpKRIk0CJnr43tVVXAaokVh5njZ~KvWumKy1xhAucLBre4sHVSKEBV7QJJepOFQuZEHSFiB~qdGql~WAbee3JydCCifc4KMg__",
      tournamentCount: 146,
      gameType: GameType.mobileGame,
    ),
  ];

  List<LastMinGameModel> lastGameModelList = [
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
        gameName: "Valorant - Unrank Medium Pool",
        availableSlot: 1,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 600,
        gameType: GameType.pcGame,
        pricePool: 1000,
        totalSlot: 2,
        tournamentStatus: TournamentStatus.completed,
        slotPercentage: 50),
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/06d8/4742/74f667842f0ef905af842d5c6ffd27ef?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ts-LPZw0Kw3OOKR-PKdNv-qt-dWDqlD2iNUewRlDJFdXiKJANKiKt3MkKox4JSrvb~Ir61~UTuEOrB4oQvaDH-y~p51UMEJqUgPcrKjXtGAlQSHlTJwLqR-~C1rn4KjAKGSmyMVOLrEg64FN4cRhZctWOAQ9w3REri037XsqceMvlpaA1g0CQ9sh5mv4b0e0YAxlGLVmgUdtVtkd6t8GPKEkRVOtSA-lHhQFkNn3p8W-QtMfW8w-XMMbJ1Pa9Msb8Oq7Tt9LIxYulcsisjj4tWROPg7IrFk2c6wgCPZ250CNrlt9yM2Velm28Ynq5aDHcI56ASLVhNz0L4S0tVlidg__",
        gameName: "BGMI - Erangel Map (Single) Big Pool",
        availableSlot: 85,
        startTime: "Start at 12 Jun, 10:00pm",
        gameType: GameType.mobileGame,
        pricePerTeam: 550,
        pricePool: 10000,
        totalSlot: 100,
        tournamentStatus: TournamentStatus.live,
        slotPercentage: 80),
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/5eca/35d1/9881efa72f3c084bf55c8a7c619b3e8b?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ZJRfR8VPD3FLiD7wGXg4DcYAfqu7FqON79yJCe~8AHq4aQ6eE1LEitJgNyV5IEf020I9r6s28tO8jee5EBUzcj6NV~K24G5EmR65KeeVwvpNneXn0JXGsNWrLyWXbuE9-CwUVUgGDMPhkJ0c4bFP7YpZ~uyyuznQDS35smW9Zg1ADQG~FNcuwdGC~FlTssqY-MovSk4iIC0Vf9kEvT2vxHXHlQtW1YWmSzrloroI5jSUFDNeuWXPVXqZKYE1Z8hss~1m786s345U2u3xEb9wji2la8Dax5NE5QAvBet8-YqCDEO8GeDtnkxd3-9BmhwaP48I-sMBPfmyWv4L6xnJGQ__",
        gameName: "Fall guys - Small pool match",
        availableSlot: 35,
        startTime: "Start at 12 Jun, 10:00pm",
        gameType: GameType.pcGame,
        pricePerTeam: 50,
        pricePool: 500,
        tournamentStatus: TournamentStatus.live,
        totalSlot: 50,
        slotPercentage: 50),
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/a99b/95b8/30274f57e0e2e22fdbc6edcf3763013d?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Yz6MaYluspyJ83wBKR2WNCXZsVufyXFz1Rb~XWKpEdoFSjHiGT4H1fZGYKOO0zPby9mvQApBD2uWs4J-R2cZxsz2RHeK5e8UoyNs8n-o0ymvEMofODQMuZn5D8LmS8-WMTivOzCEmdSMEjS~UquMe-oSfjdPpM8ewuB1pol23n0BEtNTTzAaD2~rJSRFzBN4tNHL3YQlaDK-P8j~SHedG7KheOIZGrbzRUXoI6EyYE5lBwvW8~zWcnC5Ks~8extPmUD~B6MV8deQQQUsFVZS36eHkL5Ij8mjtgbKD5-of7~kzm3g-Df-iPwRjy~AQdmFPiA81tkxVhb2R6Hg8yRW7A__",
        gameName: "Valorant - Unrank Medium Pool",
        availableSlot: 1,
        tournamentStatus: TournamentStatus.live,
        gameType: GameType.pcGame,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 600,
        pricePool: 1000,
        totalSlot: 2,
        slotPercentage: 50),
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/06d8/4742/74f667842f0ef905af842d5c6ffd27ef?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ts-LPZw0Kw3OOKR-PKdNv-qt-dWDqlD2iNUewRlDJFdXiKJANKiKt3MkKox4JSrvb~Ir61~UTuEOrB4oQvaDH-y~p51UMEJqUgPcrKjXtGAlQSHlTJwLqR-~C1rn4KjAKGSmyMVOLrEg64FN4cRhZctWOAQ9w3REri037XsqceMvlpaA1g0CQ9sh5mv4b0e0YAxlGLVmgUdtVtkd6t8GPKEkRVOtSA-lHhQFkNn3p8W-QtMfW8w-XMMbJ1Pa9Msb8Oq7Tt9LIxYulcsisjj4tWROPg7IrFk2c6wgCPZ250CNrlt9yM2Velm28Ynq5aDHcI56ASLVhNz0L4S0tVlidg__",
        gameName: "BGMI - Erangel Map (Single) Big Pool",
        availableSlot: 85,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 550,
        tournamentStatus: TournamentStatus.live,
        gameType: GameType.mobileGame,
        pricePool: 10000,
        totalSlot: 100,
        slotPercentage: 70),
    LastMinGameModel(
        gameImg:
            "https://s3-alpha-sig.figma.com/img/5eca/35d1/9881efa72f3c084bf55c8a7c619b3e8b?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ZJRfR8VPD3FLiD7wGXg4DcYAfqu7FqON79yJCe~8AHq4aQ6eE1LEitJgNyV5IEf020I9r6s28tO8jee5EBUzcj6NV~K24G5EmR65KeeVwvpNneXn0JXGsNWrLyWXbuE9-CwUVUgGDMPhkJ0c4bFP7YpZ~uyyuznQDS35smW9Zg1ADQG~FNcuwdGC~FlTssqY-MovSk4iIC0Vf9kEvT2vxHXHlQtW1YWmSzrloroI5jSUFDNeuWXPVXqZKYE1Z8hss~1m786s345U2u3xEb9wji2la8Dax5NE5QAvBet8-YqCDEO8GeDtnkxd3-9BmhwaP48I-sMBPfmyWv4L6xnJGQ__",
        gameName: "Fall guys - Small pool match",
        availableSlot: 35,
        startTime: "Start at 12 Jun, 10:00pm",
        pricePerTeam: 80,
        pricePool: 500,
        tournamentStatus: TournamentStatus.joined,
        gameType: GameType.pcGame,
        totalSlot: 35,
        slotPercentage: 90),
  ];
}
