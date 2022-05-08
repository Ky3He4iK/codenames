import 'dart:math';

import 'package:app/entity/entities.dart';

class Mocks {
  static Room getRoom() {
    int cardCount = 42;
    int blackCardCount = 3;
    int whiteCardCount = 4;
    int teamsCount = 4;
    int time = 60*1000;
    int nextTime = DateTime.now().millisecondsSinceEpoch  + time;
    return Room(
        1,
        Settings(
          teamsCount,
          time,
          cardCount,
          blackCardCount,
          whiteCardCount,
        ),
        [
          Player(
            1,
            "User1",
            GameColor.BLUE,
            UserRole.CAPTAIN,
          ),
          Player(
            2,
            "User2",
            GameColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            3,
            "User3",
            GameColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            4,
            "User4",
            GameColor.RED,
            UserRole.CAPTAIN,
          ),
          Player(
            5,
            "User5",
            GameColor.RED,
            UserRole.PLAYER,
          ),
          Player(
            6,
            "User6",
            GameColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            7,
            "User7",
            GameColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            8,
            "User8",
            GameColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            8,
            "User9",
            GameColor.GREEN,
            UserRole.CAPTAIN,
          ),
        ],
        Player(
          1,
          "User2",
          GameColor.BLUE,
          UserRole.PLAYER,
        ),
        "FFFFFF",
        0,
        "TestRoom",
        Game(
            randomCards(cardCount, blackCardCount, whiteCardCount, teamsCount),
            hints(teamsCount),
            GameStatus.PLAYING,
            TurnStatus.GUESSING,
            GameColor.GREEN,
            nextTime,
        )
    );
  }

  static List<String> words = [
    "АГЕНТ", "АКТ", "АКЦИЯ", "АЛЬБОМ", "АМФИБИЯ",
    "АППАРАТ", "БАБОЧКА", "БАЗА", "БАНК", "БАНЯ",
    "БАР", "БАРЬЕР", "БАССЕЙН", "БАТАРЕЯ", "БАШНЯ",
    "БЕЛОК", "БЕРЁЗА", "БИЛЕТ", "БИРЖА", "БЛОК", "БОБ"
  ];

  static List<CardInfo> randomCards(int count, int black, int white, int teamsCount) {
    final _random = Random();
    int eachTeamColorCount = (count - black - white) ~/ teamsCount;
    white += (count - black - white) % teamsCount;
    List<CardInfo> cards = [];
    for (var i = 0; i < white; i++) {
      var word = words[_random.nextInt(words.length)];
      cards.add(CardInfo(word, GameColor.WHITE, false, []));
    }
    for (var i = 0; i < black; i++) {
      var word = words[_random.nextInt(words.length)];
      cards.add(CardInfo(word, GameColor.BLACK, false, []));
    }
    for (var i = 0; i < teamsCount; i++) {
      for (var j = 0; j < eachTeamColorCount; j++) {
        var word = words[_random.nextInt(words.length)];
        cards.add(CardInfo(word, GameColor.values[i], false, []));
      }
    }
    cards.shuffle(_random);
    return cards;
  }

  static List<Hint> hints(int teamCount) {
    final _random = Random();
    List<Hint> hints = [];
    for (var i = 0; i < teamCount; i++) {
      for (var j = 0; j < _random.nextInt(10); j++) {
        Hint h = Hint(words[_random.nextInt(words.length)], _random.nextInt(5), GameColor.values[i]);
        hints.add(h);
      }
    }
    return hints;
  }
}