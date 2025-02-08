import 'package:carousel_slider/carousel_controller.dart';
import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';

class HomeController extends GetxController {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  RxInt currentCarousel = 0.obs;

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
}
