import 'package:playmaster_ui/dependency.dart';

class TopGameModel {
  String? gameName;
  String? gameImg;
  int? tournamentCount;
  GameType? gameType;
  RxBool? isGameSelected;

  TopGameModel({this.gameName, this.gameImg, this.tournamentCount, this.gameType, this.isGameSelected});

  TopGameModel.fromJson(Map<String, dynamic> json) {
    gameName = json['gameName'];
    gameImg = json['gameImg'];
    tournamentCount = json['tournamentCount'];
    gameType = json['gameType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameName'] = gameName;
    data['gameImg'] = gameImg;
    data['tournamentCount'] = tournamentCount;
    data['gameType'] = gameType;
    return data;
  }
}
