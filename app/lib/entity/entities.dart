enum TeamColor { BLACK, WHITE, BLUE, RED, GREEN, YELLOW }

enum UserRole { CAPTAIN, PLAYER, OBSERVER }

class Hint {
  String word;
  int number;
  TeamColor team;

  Hint(this.word, this.number, this.team);
}

class Card {
  String text;
  TeamColor color;
  String state;
  List<int> choicedUsers;

  Card(this.text, this.color, this.state, this.choicedUsers);
}

class Game {
  List<Card> cards;
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
  Game game;

  Room(this.roomId, this.settings, this.players, this.owner, this.inviteCode,
      this.type, this.name, this.game);
}
