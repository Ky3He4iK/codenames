import 'package:flutter/material.dart';

import '../style/colors.dart';
import 'square_button.dart';
import 'text_widget.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({Key? key, required this.color, required this.text, required this.count,}) : super(key: key);
  final Color color;
  final String text;
  final int count;
  @override
  State<CountWidget> createState() => _CountWidget();
}
class _CountWidget extends State<CountWidget> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        children: [
          Center(child: TextWidget(text: widget.text, size: TextSize.NORMAL)),
          SizedBox(
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