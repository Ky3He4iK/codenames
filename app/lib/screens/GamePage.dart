import 'package:app/entity/entities.dart';
import 'package:app/mocks/mocks.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/cards_field.dart';
import 'package:app/widget/game_top_bar_widget.dart';
import 'package:app/widget/hint_widget.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage() : super();

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Room room;
  late List<TeamColor> colors;
  late int pickedHintListIndex;

  @override
  void initState() {
    room = Mocks.getRoom();
    colors = [TeamColor.BLUE, TeamColor.RED, TeamColor.GREEN, TeamColor.YELLOW];
    pickedHintListIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    GameTopBarWidget(room: room, colors: colors),
                    CardsField(
                      cards: room.game!.cards,
                    )
                  ],
                )),
            Flexible(
              child: Column(
                children: [
                  for (int i = 0; i < room.settings.teamsCount; i++)
                    CardWidget(
                        color: colors[i].color,
                        flex: pickedHintListIndex == i ? 5 : 1,
                        onTap: () {
                          setState(() {
                            pickedHintListIndex = i;
                          });
                        },
                        child: HintWidget(
                          hints: room.game!.hints.where((h) => h.team == colors[i]).toList(),
                          isOpened: pickedHintListIndex == i,
                          teamColor: colors[i],
                        )),
                ],
              ),
            ),
          ],
        ));
  }
}
