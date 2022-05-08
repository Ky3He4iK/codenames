import 'dart:ui';

import '../style/colors.dart';

enum GameColor { BLUE, RED, GREEN, YELLOW, BLACK, WHITE, }

enum UserRole { CAPTAIN, PLAYER, OBSERVER }
enum GameStatus { PREPARING, FINISHED, PLAYING }
enum TurnStatus { WRITING, GUESSING }

class Hint {
  String word;
  int number;
  GameColor team;

  Hint(this.word, this.number, this.team);

  String getText() {
    return word + " " + number.toString();
  }
}

class CardInfo {
  String text;
  GameColor color;
  bool isOpened;
  List<int> choicedUsers;

  CardInfo(this.text, this.color, this.isOpened, this.choicedUsers);
}

class Game {
  List<CardInfo> cards;
  List<Hint> hints;
  GameStatus status;
  TurnStatus turnStatus;
  GameColor curTeamColor;
  int nextTurnTime;

  Game(this.cards, this.hints, this.status, this.turnStatus, this.curTeamColor, this.nextTurnTime);

  String turnText() {
    switch (status) {
      case GameStatus.FINISHED:
        return "ИГРА ЗАВЕРШЕНА";
      case GameStatus.PREPARING:
        return "СТАДИЯ\nПОДГОТОВКИ";
      case GameStatus.PLAYING:
        break;
    }
    String text = "ХОД";
    switch (turnStatus) {
      case TurnStatus.WRITING:
        text += " КАПИТАНА\n";
        break;
      case TurnStatus.GUESSING:
        text += " ИГРОКОВ\n";
    }
    switch (curTeamColor) {
      case GameColor.BLUE:
        text += "СИНЕЙ КОМАНДЫ";
        break;
      case GameColor.RED:
        text += "КРАСНОЙ КОМАНДЫ";
        break;
      case GameColor.YELLOW:
        text += "ЖЕЛТОЙ КОМАНДЫ";
        break;
      case GameColor.GREEN:
        text += "ЗЕЛЕНОЙ КОМАНДЫ";
        break;
      default:
        break;
    }
    return text;
  }
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
  GameColor team;
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

extension GameColorExtension on GameColor {

  Color get color {
    switch (this) {
      case GameColor.BLUE:
        return ColorConstants.blue;
      case GameColor.RED:
        return ColorConstants.red;
      case GameColor.GREEN:
        return ColorConstants.green;
      case GameColor.YELLOW:
        return ColorConstants.yellow;
      case GameColor.BLACK:
        return ColorConstants.black;
      default:
        return ColorConstants.white;
    }
  }
  static List<GameColor> forTeams() {
    return [GameColor.BLUE, GameColor.RED, GameColor.GREEN, GameColor.YELLOW];
  }
  Color get textColor {
    switch (this) {
      case GameColor.BLUE:
        return ColorConstants.white;
      case GameColor.RED:
        return ColorConstants.white;
      case GameColor.GREEN:
        return ColorConstants.white;
      case GameColor.YELLOW:
        return ColorConstants.black;
      case GameColor.BLACK:
        return ColorConstants.white;
      default:
        return ColorConstants.black;
    }
  }
}
