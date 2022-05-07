import 'package:flutter/material.dart';
import '../style/colors.dart';
import 'text_widget.dart';
import 'square_button.dart';

class CountWidget extends StatefulWidget {
  CountWidget({Key? key, required this.color, required this.text,}) : super(key: key);
  final Color color;
  final String text;

  @override
  State<CountWidget> createState() => _CountWidget();
}
class _CountWidget extends State<CountWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        children: [
          Center(child: TextWidget(text: widget.text, size: TextSize.NORMAL)),
          Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SquareButtonWidget(
                    pic: 'assets/images/minus.svg',
                    color: widget.color,
                    colorSvg: ColorConstants.white,
                    fun: () {
                      setState(() {
                        count--;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(child: TextWidget(text: count.toString(), size: TextSize.BIG)),
                  ),
                  SquareButtonWidget(
                    pic: 'assets/images/plus.svg',
                    color: widget.color,
                    colorSvg: ColorConstants.white,
                    fun: () {
                      setState(() {
                        count++;
                      });
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
