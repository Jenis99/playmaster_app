import 'package:playmaster_ui/dependency.dart';

enum GameType { pcGame, mobileGame }

extension GameTypeTitle on GameType {
  String getTitle(GameType gameType) {
    if (gameType == GameType.pcGame) {
      return AppString.pcGame;
    } else {
      return AppString.mobileGame;
    }
  }
}
