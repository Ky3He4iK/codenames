import 'package:flutter/material.dart';

import '../style/colors.dart';
import 'square_button.dart';
import 'text_widget.dart';

class CountWidget extends StatelessWidget {
  CountWidget({Key? key, required this.color, required this.text, required this.count, this.onChanged,}) : super(key: key);
  final int count;
  final Color color;
  final String text;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        children: [
          Center(child: TextWidget(text: text, size: TextSize.NORMAL)),
          SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SquareButtonWidget(
                    pic: 'assets/images/minus.svg',
                    color: color,
                    colorSvg: ColorConstants.white,
                    fun: () {
                      int c = count - 1;
                      onChanged!(c);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(child: TextWidget(text: count.toString(), size: TextSize.BIG)),
                  ),
                  SquareButtonWidget(
                    pic: 'assets/images/plus.svg',
                    color: color,
                    colorSvg: ColorConstants.white,
                    fun: () {
                      int c = count + 1;
                      onChanged!(c);
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
