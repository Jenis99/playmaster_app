import 'package:playmaster_ui/dependency.dart';

class LastMinGameModel {
  String? gameImg;
  String? gameName;
  String? gameCategory;
  String? gamePoolSize;
  GameType? gameType;
  String? startTime;
  int? pricePerTeam;
  int? pricePool;
  int? totalSlot;
  int? availableSlot;
  int? slotPercentage;
  String? gameFee;
  TournamentStatus? tournamentStatus;

  LastMinGameModel({
    this.gameImg,
    this.gameName,
    this.pricePerTeam,
    this.pricePool,
    this.gameType,
    this.totalSlot,
    this.availableSlot,
    this.slotPercentage,
    this.gameCategory,
    this.gamePoolSize,
    this.startTime,
    this.gameFee,
    this.tournamentStatus = TournamentStatus.completed,
  });

  LastMinGameModel.fromJson(Map<String, dynamic> json) {
    gameImg = json['gameImg'];
    gameName = json['gameName'];
    pricePerTeam = json['pricePerTeam'];
    pricePool = json['pricePool'];
    totalSlot = json['totalSlot'];
    availableSlot = json['availableSlot'];
    slotPercentage = json['slotPercentage'];
    gameCategory = json['gameCategory'];
    gamePoolSize = json['gamePoolSize'];
    startTime = json['startTime'];
    gameType = json['gameType'];
    tournamentStatus = json['tournamentStatus'];
    gameFee = json['entryFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameImg'] = gameImg;
    data['gameName'] = gameName;
    data['pricePerTeam'] = pricePerTeam;
    data['pricePool'] = pricePool;
    data['totalSlot'] = totalSlot;
    data['slotPercentage'] = slotPercentage;
    data['gameCategory'] = gameCategory;
    data['gamePoolSize'] = gamePoolSize;
    data['gameType'] = gameType;
    data['tournamentStatus'] = tournamentStatus;
    data['entryFee'] = gameFee;
    return data;
  }
}
