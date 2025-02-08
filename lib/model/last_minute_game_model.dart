class LastMinGameModel {
  String? gameImg;
  String? gameName;
  String? gameCategory;
  String? gamePoolSize;
  String? startTime;
  int? pricePerTeam;
  int? pricePool;
  int? totalSlot;
  int? availableSlot;
  int? slotPercentage;

  LastMinGameModel({
    this.gameImg,
    this.gameName,
    this.pricePerTeam,
    this.pricePool,
    this.totalSlot,
    this.availableSlot,
    this.slotPercentage,
    this.gameCategory,
    this.gamePoolSize,
    this.startTime,
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gameImg'] = gameImg;
    data['gameName'] = gameName;
    data['pricePerTeam'] = pricePerTeam;
    data['pricePool'] = pricePool;
    data['totalSlot'] = totalSlot;
    data['slotPercentage'] = slotPercentage;
    data['gameCategory'] = gameCategory;
    data['gamePoolSize'] = gamePoolSize;
    return data;
  }
}
