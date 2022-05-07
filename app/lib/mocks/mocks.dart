import 'dart:math';

import 'package:app/entity/entities.dart';

class Mocks {
  static Room getRoom() {
    return Room(
        1,
        Settings(
          4,
          60,
          42,
          5,
          5,
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
        null);
  }

  static List<String> words = [
    "АГЕНТ", "АКТ", "АКЦИЯ", "АЛЬБОМ", "АМФИБИЯ", "АППАРАТ", "БАБОЧКА", "БАЗА", "БАНК", "БАНЯ", "БАР", "БАРЬЕР", "БАССЕЙН", "БАТАРЕЯ", "БАШНЯ", "БЕЛОК", "БЕРЁЗА", "БИЛЕТ", "БИРЖА", "БЛОК", "БОБ"
  ];

  static List<CardInfo> randomCards(int count) {
    final _random = Random();
    List<CardInfo> cards = [];
    for (var i = 0; i < count; i++) {
      var word = words[_random.nextInt(words.length)];
      var color = TeamColor.values[_random.nextInt(TeamColor.values.length)];
      cards.add(CardInfo(word, color, "OPEN", [0, 1, 2]));
    }
    return cards;
  }

  static List<List<String>> hints(int teamCount) {
    final _random = Random();
    List<List<String>> hints = [];
    for (var i = 0; i < teamCount; i++) {
      hints.add([]);
      for (var j = 0; j < _random.nextInt(10); j++) {
        hints[i].add(words[_random.nextInt(words.length)] + " " + _random.nextInt(5).toString());
      }
    }
    return hints;
  }
}