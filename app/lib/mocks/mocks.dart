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
            "Судно",
            GameColor.BLUE,
            UserRole.CAPTAIN,
          ),
          Player(
            2,
            "Биба",
            GameColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            3,
            "Боба",
            GameColor.BLUE,
            UserRole.PLAYER,
          ),
          Player(
            4,
            "Окошко",
            GameColor.RED,
            UserRole.CAPTAIN,
          ),
          Player(
            5,
            "Соломид",
            GameColor.RED,
            UserRole.PLAYER,
          ),
          Player(
            6,
            "Тумбочка",
            GameColor.YELLOW,
            UserRole.CAPTAIN,
          ),
          Player(
            7,
            "xXx_Guts_xXx",
            GameColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            8,
            "https://clck.ru/hcJi9",
            GameColor.YELLOW,
            UserRole.PLAYER,
          ),
          Player(
            9,
            "Кровать",
            GameColor.GREEN,
            UserRole.CAPTAIN,
          ),
          Player(
            10,
            "Дранник",
            GameColor.GREEN,
            UserRole.PLAYER,
          ),
          Player(
            11,
            "ЗЛОЙ ГОСТ 19.103-77",
            GameColor.GREEN,
            UserRole.PLAYER,
          ),
        ],
        Player(
          2,
          "Биба",
          GameColor.BLUE,
          UserRole.PLAYER,
        ),
        "FAQLOL",
        0,
        "TestRoom",
        Game(
            randomCards(cardCount, blackCardCount, whiteCardCount, teamsCount),
            hints(teamsCount),
            GameStatus.PLAYING,
            TurnStatus.GUESSING,
            GameColor.BLUE,
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

  static String generateName() {
    final _random = Random();
    return words[_random.nextInt(words.length)] +"_"+ words[_random.nextInt(words.length)];
  }
}