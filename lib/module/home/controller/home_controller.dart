import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/model/model.dart';

class HomeController extends GetxController {
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
}
