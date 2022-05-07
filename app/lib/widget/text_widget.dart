import 'package:flutter/material.dart';
import 'package:app/style/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key, required this.text, this.size: TextSize.NORMAL, this.color: ColorConstants.black, this.enableFit = true
  }) : super(key: key);

  final String text;
  final TextSize size;
  final Color color;
  final bool enableFit;

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
        return 20;
      case TextSize.HEADING_GAME:
        return 36;
      default:
        return 28;
    }
  }

}