import 'package:flutter/material.dart';
import 'package:app/style/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key, required this.text, this.size: TextSize.NORMAL,
  }) : super(key: key);

  final String text;
  final TextSize size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: ColorConstants.black,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
          fontSize: size.size),
    );
  }
}
enum TextSize {
  BIG, NORMAL, SMALL

}
extension TextSizeExtension on TextSize {

  double get size {
    switch (this) {
      case TextSize.BIG:
        return 54;
      case TextSize.SMALL:
        return 20;
      default:
        return 28;
    }
  }

}