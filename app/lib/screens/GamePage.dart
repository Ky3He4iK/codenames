
import 'package:app/mocks/mocks.dart';
import 'package:app/ui_models/models.dart';
import 'package:app/widget/team_card.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/widget/card.dart';
import 'package:app/style/colors.dart';
import 'package:app/entity/entities.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/count_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage() : super();
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Room room;
  late List<TeamColor> colors;
  late List<CardInfo> cards;
  late SquareButtonModel gameModel;
  late int pickedHintListIndex;
  late List<List<String>>  hints;
  @override
  void initState() {
    room = Mocks.getRoom();
    colors = [TeamColor.BLUE, TeamColor.RED, TeamColor.GREEN, TeamColor.YELLOW];
    cards = Mocks.randomCards(room.settings.cardCount);
    gameModel = SquareButtonModel('assets/images/people.svg', ColorConstants.black, ColorConstants.white, () {
      Navigator.pushNamed(context, '/team');
    });
    pickedHintListIndex = 0;
    hints = Mocks.hints(room.settings.teamsCount);
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
                    TopBar(),
                    Cards(cards: cards,)
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
                      child: HintWidget(hints: hints[i], isOpened: pickedHintListIndex == i, teamColor: colors[i],)
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Flexible TopBar() {
    return Flexible(
      flex: 1,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SquareButtonWidget(
            pic: gameModel.picturePath,
            color: gameModel.buttonColor,
            colorSvg: gameModel.svgColor,
            fun: gameModel.fun,
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
            child: Expanded(
              child: Center(
                child: TextWidget(text: room.settings.turnTime.toString(), size: TextSize.BIG),
              ),
            )),
        CardWidget(
          flex: 3,
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < room.settings.teamsCount; i++)
                      TeamPoints(
                        color: colors[i].color,
                        points: i,
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
}

class HintWidget extends StatelessWidget {

  HintWidget({
    Key? key,
    required this.hints,
    required this.isOpened,
    required this.teamColor
  }) : super(key: key);

  final List<String> hints;
  final TeamColor teamColor;
  bool isOpened;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: isOpened ?
            SingleChildScrollView(
              child: Column(
                children:  [
                     for(int l = 0; l < hints.length; l++)
                       TextWidget(text: hints[l], size: TextSize.SMALL,),
                    if (hints.isEmpty)
                      TextWidget(text: "Слов нет", size: TextSize.SMALL,)
                ]
              ),
            ) :
            Center(child: TextWidget(text: hints.isNotEmpty ? hints.last : "Слов нет", size: TextSize.SMALL,)),
          ),
          if (isOpened)
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.w400,
                      fontSize: TextSize.SMALL.size),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      labelText: null,
                      hintText: 'Подсказка'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: teamColor.color),
                        child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextWidget(text: "Отправить", color: teamColor.textColor, size: TextSize.SMALL,),
                    )),
                  ),
                ),
            ],
          ),
              ))
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({
    Key? key, required this.cards
  }) : super(key: key) {
    if (cards.length % 7 == 0){
      cardsInRow = 7;
    } else if (cards.length % 6 == 0){
      cardsInRow = 6;
    } else if (cards.length % 5 == 0){
      cardsInRow = 5;
    } else {
      cardsInRow = 4;
    }
    rowCount = cards.length ~/ cardsInRow;
  }
  final List<CardInfo> cards;
  late int cardsInRow;
  late int rowCount;
  @override
  Widget build(BuildContext context) {
    return CardWidget(flex: 4, child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < rowCount; i++)
              Expanded(
                child: Row(
                  children: [
                    for (int j = 0; j < cardsInRow; j++)
                      WordCard(card: cards[i*cardsInRow + j], isOpened: false, teamColor: ColorConstants.blue, guesses: 0,),
                  ],
                ),
              )
          ],
        ),
      ),
    ));
  }
}

class WordCard extends StatefulWidget {
  const WordCard({
    Key? key,
    required this.card,
    required this.isOpened,
    required this.teamColor,
    required this.guesses,
  }) : super(key: key);
  final CardInfo card;
  final bool isOpened;
  final Color teamColor;
  final int guesses;
  @override
  State<WordCard> createState() => _WordCardState(card, isOpened, teamColor, guesses);
}

class _WordCardState  extends State<WordCard>  {
   _WordCardState(
    this.card,
    this.isOpened,
    this.teamColor,
    this.guesses,
  );
   final CardInfo card;
   final Color teamColor;
   bool isOpened;
   bool isTappedByMe = false;
   int guesses = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            guesses += isTappedByMe ? -1 : 1;
            isTappedByMe = !isTappedByMe;
          });
        },
        onLongPress: () {
          setState(() {
            isOpened = !isOpened;
          });
        },
        child: Card(
          color: isOpened ? card.color.color : ColorConstants.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          child: Stack(
            children: [
              if(!isOpened)
              Positioned(
                top:0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < guesses; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 12,
                          height: 12,
                            decoration: BoxDecoration(
                                color: teamColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(child: TextWidget(text: card.text, color: isOpened ? card.color.textColor : ColorConstants.black,)),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamPoints extends StatelessWidget {
  const TeamPoints({
    Key? key,
    required this.color,
    required this.points,
    this.isLast = false,
    this.isFirst = false,
  }) : super(key: key);

  final Color color;
  final int points;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Column(
            children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isFirst ? 10 : 0),
              topRight: Radius.circular(
                  isLast ? 10 : 0),
              )
              )
            ),
            Expanded(child: Center(child: TextWidget(text: points.toString(), size: TextSize.BIG, color: color)))],),),
          if (!isLast)
          Container(
            height: double.infinity,
            width: 2,
            color: ColorConstants.black.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}