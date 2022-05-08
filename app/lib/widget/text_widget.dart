import 'package:app/style/colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    Key? key, required this.text, this.size: TextSize.NORMAL, this.color: ColorConstants.black, this.enableFit = true
  }) : super(key: key);

  TextWidget.c(this.text, this.size) : super() {
    color = ColorConstants.black;
    enableFit = true;
  }
  final String text;
  final TextSize size;
  late Color color;
  late bool enableFit;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: enableFit ? BoxFit.scaleDown : BoxFit.none,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            fontSize: size.size),
      ),
    );
  }
}
enum TextSize {
  BIG, NORMAL, SMALL, HEADING_GAME

}
extension TextSizeExtension on TextSize {

  double get size {
    switch (this) {
      case TextSize.BIG:
        return 54;
      case TextSize.SMALL:
        return 18;
      case TextSize.HEADING_GAME:
        return 36;
      default:
        return 28;
    }
  }
  FontWeight get weight {
    switch (this) {
      case TextSize.BIG:
        return FontWeight.w900;
      case TextSize.SMALL:
        return FontWeight.w200;
      case TextSize.HEADING_GAME:
        return FontWeight.w700;
      default:
        return FontWeight.w700;
    }
  }

}