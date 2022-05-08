import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';

class SquareButtonWidget extends StatelessWidget {
  const SquareButtonWidget({
    Key? key,
    required this.pic,
    this.fun,
    this.color = ColorConstants.black,
    this.colorSvg = ColorConstants.white,
    this.size = 40,
  }) : super(key: key);

  final Color color;
  final Color colorSvg;
  final String pic;
  final double size;
  final VoidCallback? fun;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: fun,
        child: SvgPicture.asset(
          pic,
          color: colorSvg,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
