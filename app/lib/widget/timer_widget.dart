
import 'dart:async';

import 'package:app/style/colors.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget(this.nextTurnTime) : super();
  int nextTurnTime;
  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  String time = "-";
  late Timer _everySecond;
  bool isTick = false;

  @override
  void initState() {
    super.initState();
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        widget.nextTurnTime += 500;
        int t = ((widget.nextTurnTime - DateTime.now().millisecondsSinceEpoch ) ~/ 1000);
        time = t.toString();
        if (t < 10) isTick = !isTick;
        if (t == 0) _everySecond.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: TextWidget(
          text: time,
          size: TextSize.BIG,
          color: isTick ? ColorConstants.red : ColorConstants.black,
        ),
      ),
    );
  }
}
