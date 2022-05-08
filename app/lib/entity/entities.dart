import 'dart:ui';

import '../style/colors.dart';

enum TeamColor { BLUE, RED, GREEN, YELLOW, BLACK, WHITE, }

enum UserRole { CAPTAIN, PLAYER, OBSERVER }

class Hint {
  String word;
  int number;
  TeamColor team;

  Hint(this.word, this.number, this.team);

  String getText() {
    return word + " " + number.toString();
  }
}

class CardInfo {
  String text;
  TeamColor color;
  bool isOpened;
  List<int> choicedUsers;

  CardInfo(this.text, this.color, this.isOpened, this.choicedUsers);
}

class Game {
  List<CardInfo> cards;
  List<Hint> hints;
  String status;
  int nextTurnTime;

  Game(this.cards, this.hints, this.status, this.nextTurnTime);
}

class Settings {
  int teamsCount;
  int turnTime; // seconds
  int cardCount;
  int blackCardCount;
  int whiteCardCount;

  Settings(this.teamsCount, this.turnTime, this.cardCount, this.blackCardCount,
      this.whiteCardCount);
}

class Player {
  int playerId;
  String name;
  TeamColor team;
  UserRole role;

  Player(this.playerId, this.name, this.team, this.role);
}

class Room {
  int roomId;
  Settings settings;
  List<Player> players;
  Player owner;
  String inviteCode;
  int type;
  String name;
  Game? game;

  Room(this.roomId, this.settings, this.players, this.owner, this.inviteCode,
      this.type, this.name, this.game);
}

extension TeamColorExtension on TeamColor {

  Color get color {
    switch (this) {
      case TeamColor.BLUE:
        return ColorConstants.blue;
      case TeamColor.RED:
        return ColorConstants.red;
      case TeamColor.GREEN:
        return ColorConstants.green;
      case TeamColor.YELLOW:
        return ColorConstants.yellow;
      case TeamColor.BLACK:
        return ColorConstants.black;
      default:
        return ColorConstants.white;
    }
  }
  static List<TeamColor> forTeams() {
    return [TeamColor.BLUE, TeamColor.RED, TeamColor.GREEN, TeamColor.YELLOW];
  }
  Color get textColor {
    switch (this) {
      case TeamColor.BLUE:
        return ColorConstants.white;
      case TeamColor.RED:
        return ColorConstants.white;
      case TeamColor.GREEN:
        return ColorConstants.white;
      case TeamColor.YELLOW:
        return ColorConstants.black;
      case TeamColor.BLACK:
        return ColorConstants.white;
      default:
        return ColorConstants.black;
    }
  }
}