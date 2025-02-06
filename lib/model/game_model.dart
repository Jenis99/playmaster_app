class GameModel {
  String? gameImg;
  String? gameName;
  String? prizePool;
  String? gameFee;
  String? startTime;

  GameModel({this.gameImg, this.gameName, this.prizePool, this.gameFee, this.startTime});

  GameModel.fromJson(Map<String, dynamic> json) {
    gameImg = json['gameImg'];
    gameName = json['gameName'];
    prizePool = json['prizePool'];
    gameFee = json['gamePrize'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameImg'] = gameImg;
    data['gameName'] = gameName;
    data['prizePool'] = prizePool;
    data['gamePrize'] = gameFee;
    data['startTime'] = startTime;
    return data;
  }
}
