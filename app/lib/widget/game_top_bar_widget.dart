
import 'dart:async';

import 'package:app/entity/entities.dart';
import 'package:app/style/colors.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/team_point_widget.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class GameTopBarWidget extends StatefulWidget {
  const GameTopBarWidget({
    Key? key,
    required this.room,
    required this.colors,
  }) : super(key: key);

  final Room room;
  final List<TeamColor> colors;
  @override
  State<GameTopBarWidget> createState() => _GameTopBarWidgetState();
}

class _GameTopBarWidgetState extends State<GameTopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SquareButtonWidget(
            pic: 'assets/images/people.svg',
            color: ColorConstants.black,
            colorSvg: ColorConstants.white,
            fun: () {Navigator.pushNamed(context, '/team');},
          ),
        ),
        CardWidget(
            flex: 2,
            backgroundColor: ColorConstants.white,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Center(child: TextWidget(text: "ХОД КАПИТАНА\nСИНЕЙ КОМАНДЫ", color: ColorConstants.blue,))),
              ),
            )),
        CardWidget(
            flex: 1,
            child: TimerWidget(widget.room.game!.nextTurnTime)),
        CardWidget(
            flex: 3,
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < widget.room.settings.teamsCount; i++)
                    TeamPoints(
                      color: widget.colors[i].color,
                      points: i,
                      isFirst: i == 0,
                      isLast: i == widget.room.settings.teamsCount - 1,
                    )
                ],
              ),
            )
        ),
      ]),
    );
  }
}

class TimerWidget extends StatefulWidget {

  const TimerWidget(this.nextTurnTime) : super();

  final int nextTurnTime;

  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  String time = "-";
  late Timer _everySecond;
  bool isTick = false;

  @override
  void initState() {
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        int t = ((widget.nextTurnTime - DateTime.now().millisecondsSinceEpoch) ~/ 1000);
        time = t.toString();
        if (t < 10)
          isTick = !isTick;
        if (t == 0)
          _everySecond.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: TextWidget(text: time, size: TextSize.BIG, color: isTick ? ColorConstants.red : ColorConstants.black,),
      ),
    );
  }
}
