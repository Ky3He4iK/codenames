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
            TeamColor.BLUE,
            UserRole.CAPTAIN,
          ),
          Player(
            2,
            "User2",
            TeamColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            3,
            "User3",
            TeamColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            4,
            "User4",
            TeamColor.RED,
            UserRole.CAPTAIN,
          ),
          Player(
            5,
            "User5",
            TeamColor.RED,
            UserRole.PLAYER,
          ),
          Player(
            6,
            "User6",
            TeamColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            7,
            "User7",
            TeamColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            8,
            "User8",
            TeamColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            8,
            "User9",
            TeamColor.GREEN,
            UserRole.CAPTAIN,
          ),
        ],
        Player(
          1,
          "User2",
          TeamColor.BLUE,
          UserRole.PLAYER,
        ),
        "FFFFFF",
        0,
        "TestRoom",
        Game(
            randomCards(cardCount, blackCardCount, whiteCardCount, teamsCount),
            hints(teamsCount),
            "Status",
            nextTime,
        )
    );
  }

  static List<String> words = [
    "АГЕНТ", "АКТ", "АКЦИЯ", "АЛЬБОМ", "АМФИБИЯ", "АППАРАТ", "БАБОЧКА", "БАЗА", "БАНК", "БАНЯ", "БАР", "БАРЬЕР", "БАССЕЙН", "БАТАРЕЯ", "БАШНЯ", "БЕЛОК", "БЕРЁЗА", "БИЛЕТ", "БИРЖА", "БЛОК", "БОБ"
  ];

  static List<CardInfo> randomCards(int count, int black, int white, int teamsCount) {
    final _random = Random();
    int eachTeamColorCount = (count - black - white) ~/ teamsCount;
    white += (count - black - white) % teamsCount;
    List<CardInfo> cards = [];
    for (var i = 0; i < white; i++) {
      var word = words[_random.nextInt(words.length)];
      cards.add(CardInfo(word, TeamColor.WHITE, false, []));
    }
    for (var i = 0; i < black; i++) {
      var word = words[_random.nextInt(words.length)];
      cards.add(CardInfo(word, TeamColor.BLACK, false, []));
    }
    for (var i = 0; i < teamsCount; i++) {
      for (var j = 0; j < eachTeamColorCount; j++) {
        var word = words[_random.nextInt(words.length)];
        cards.add(CardInfo(word, TeamColor.values[i], false, []));
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
        Hint h = Hint(words[_random.nextInt(words.length)], _random.nextInt(5), TeamColor.values[i]);
        hints.add(h);
      }
    }
    return hints;
  }
}