import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/resources/app_string.dart';

enum GameType { pcGame, mobileGame }

enum TournamentStatus {
  joined(statusLabel: AppString.tournamentJoined),
  live(statusLabel: AppString.tournamentIsLive),
  completed(statusLabel: AppString.tournamentCompleted);

  const TournamentStatus({required this.statusLabel});

  final String statusLabel;
}

extension GameTypeTitle on GameType {
  String getTitle(GameType gameType) {
    if (gameType == GameType.pcGame) {
      return AppString.pcGame;
    } else {
      return AppString.mobileGame;
    }
  }
}
