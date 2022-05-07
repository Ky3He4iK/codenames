

import 'dart:ui';

import 'package:app/style/colors.dart';

class SquareButtonModel {
  String picturePath;
  Color buttonColor;
  Color svgColor;
  VoidCallback? fun;
  SquareButtonModel(this.picturePath, this.buttonColor, this.svgColor, this.fun);
}