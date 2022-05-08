import 'package:app/entity/entities.dart';
import 'package:app/mocks/mocks.dart';
import 'package:app/style/colors.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/hint_widget.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/team_point_widget.dart';
import 'package:app/widget/text_widget.dart';
import 'package:app/widget/timer_widget.dart';
import 'package:app/widget/word_card_widget.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage() : super();

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Room room;
  List<GameColor> colors = GameColorExtension.forTeams();
  late int pickedHintListIndex;
  late int cardsInRow;
  late int rowCount;
  Player me = Player(1, "Это я", GameColor.GREEN, UserRole.PLAYER);
  List<int> points = [10, 10, 10, 10];
  @override
  void initState() {
    super.initState();
    room = Mocks.getRoom();
    pickedHintListIndex = room.game!.curTeamColor.index; //Влияет только на то, какой список открыт. Его надо менять при каждом переходе хода.
    cardsInRow = 4;
    for (int i = 7; i > 3; i ++) {
      if (room.game!.cards.length % i == 0){
        cardsInRow = i;
        break;
      }
    }
    rowCount = room.game!.cards.length ~/ cardsInRow;
  }

  @override
  Widget build(BuildContext context) {
    calculate();
    return Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    topBar(),
                    cardField()
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

  Flexible topBar() {
    return Flexible(
      flex: 1,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8),
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
                child: Center(
                    child: TextWidget(
                      text: room.game!.turnText(),
                      color: room.game!.status == GameStatus.PLAYING
                      ? room.game!.curTeamColor.color
                      : ColorConstants.black,
                    )
                ),
              ),
            )),
        CardWidget(
            flex: 1,
            child: TimerWidget(room.game!.nextTurnTime)),
        CardWidget(
            flex: 3,
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < room.settings.teamsCount; i++)
                    TeamPoints(
                      color: colors[i].color,
                      points: points[i],
                      isFirst: i == 0,
                      isLast: i == room.settings.teamsCount - 1,
                    )
                ],
              ),
            )
        ),
      ]),
    );
  }

  CardWidget cardField() {
    return CardWidget(flex: 4, child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List<Widget>.generate(rowCount, (i) =>
            Expanded(
                child: Row(
                  children: List<Widget>.generate(cardsInRow, (j) => 
                        getCard(i*cardsInRow + j)
                  )
                ),
              )
        ),
        ),
      ),
    ));
  }

  void calculate() {
    for (int i = 0; i < room.settings.teamsCount; i++)
      points[i] = room.game!.cards.where((c) => c.color == colors[i] && !c.isOpened).toList().length;
  }

  WordCard getCard(int i) {
    var card = room.game!.cards[i];
    return WordCard(
        card: card,
        isOpened: card.isOpened,
        teamColor: me.team.color,
        guesses: card.choicedUsers.length,
        onTap: () {
          //TODO ТУТ ОТПРАВЛЯТЬ, ЧТО ПОЛЬЗОВАТЕЛЬ ВЫБРАЛ КАРТОЧКУ
          if (me.team == room.game!.curTeamColor && room.game!.status == GameStatus.PLAYING) {
            setState(() {
              List<int> players = card.choicedUsers;
              if (players.contains(me.playerId)) {
                room.game!.cards[i].choicedUsers.remove(me.playerId);
              } else {
                room.game!.cards[i].choicedUsers.add(me.playerId);
              }
            });
          }
        },
        onLongPress: () {
          // TODO ПЕРЕНЕСТИ ВСЕ В onTap(), А ЭТО СНЕСТИ, Т.К. ВРЕМЕННЫЙ ВАРИАНТ ДЛЯ ПОКАЗА НАЖАТИЯ
          if (me.team == room.game!.curTeamColor && room.game!.status == GameStatus.PLAYING) {
            setState(() {
              var isOpened = room.game!.cards[i].isOpened;
              room.game!.cards[i].isOpened = !isOpened;
              room.game!.cards[i].choicedUsers = [];
            });
          }
        }
    );
  }
}
