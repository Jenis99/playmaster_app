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

enum TransactionStatus {
  allType(statusLabel: "All type"),
  failed(statusLabel: "Failed"),
  successfully(statusLabel: "Successfully"),
  pending(statusLabel: "Pending");

  final String statusLabel;

  const TransactionStatus({required this.statusLabel});
}

enum GamePlatformType {
  allGames(platformLabel: "All Games"),
  pcGames(platformLabel: "PC Games"),
  mobileGame(platformLabel: "Mobile Games");

  final String platformLabel;

  const GamePlatformType({required this.platformLabel});
}
