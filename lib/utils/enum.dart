import 'package:playmaster_ui/dependency.dart';
import 'package:playmaster_ui/resources/app_string.dart';

enum GameType {
  pcGame(gameLabel: AppString.pcGame),
  mobileGame(gameLabel: AppString.mobileGame);

  const GameType({required this.gameLabel});

  final String gameLabel;
}

enum TournamentStatus {
  joined(statusLabel: AppString.tournamentJoined),
  live(statusLabel: AppString.tournamentIsLive),
  completed(statusLabel: AppString.tournamentCompleted);

  const TournamentStatus({required this.statusLabel});

  final String statusLabel;
}
