import 'dart:ui';

import '../style/colors.dart';
import 'entities.dart';

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