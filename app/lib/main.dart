import 'package:app/widget/team_card.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/card.dart';
import 'widget/team_card.dart';
import 'style/colors.dart';
import 'entity/entities.dart';
import 'widget/square_button.dart';
import 'widget/count_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codenames',
      theme: ThemeData(
        fontFamily: 'Neuron',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Room room = Room(
      1,
      Settings(
        4,
        60,
        30,
        5,
        5,
      ),
      [
        Player(
          1,
          "User1",
          TeamColor.BLUE,
          UserRole.CAPTAIN,
        ),
        Player(
          2,
          "User2",
          TeamColor.BLUE,
          UserRole.PLAYER,
        ),
        Player(
          3,
          "User3",
          TeamColor.BLUE,
          UserRole.PLAYER,
        ),
        Player(
          4,
          "User4",
          TeamColor.RED,
          UserRole.CAPTAIN,
        ),
        Player(
          5,
          "User5",
          TeamColor.RED,
          UserRole.PLAYER,
        ),
        Player(
          6,
          "User6",
          TeamColor.YELLOW,
          UserRole.PLAYER,
        ),
        Player(
          7,
          "User7",
          TeamColor.YELLOW,
          UserRole.PLAYER,
        ),
        Player(
          8,
          "User8",
          TeamColor.YELLOW,
          UserRole.PLAYER,
        ),
        Player(
          8,
          "User9",
          TeamColor.GREEN,
          UserRole.CAPTAIN,
        ),
      ],
      Player(
        1,
        "User2",
        TeamColor.BLUE,
        UserRole.PLAYER,
      ),
      "FFFFF",
      0,
      "TestRoom",
      null);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(children: [
                        CardWidget(
                            child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: SquareButtonWidget(
                                      pic: 'assets/images/restart.svg',
                                      color: ColorConstants.blue,
                                      colorSvg: ColorConstants.white,
                                      fun: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: SquareButtonWidget(
                                    pic: 'assets/images/pause.svg',
                                    color: ColorConstants.yellow,
                                    colorSvg: ColorConstants.black,
                                    fun: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: SquareButtonWidget(
                                    pic: 'assets/images/random.svg',
                                    color: ColorConstants.green,
                                    colorSvg: ColorConstants.white,
                                    fun: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: SquareButtonWidget(
                                    pic: 'assets/images/exit.svg',
                                    color: ColorConstants.red,
                                    colorSvg: ColorConstants.white,
                                    fun: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        const CardWidget(
                            child: Expanded(
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: TextWidget(text: 'Подготовка игры', size: TextSize.BIG)),
                          ),
                        )),
                      ]),
                    ),
                    Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TeamCardWidget(
                                "User2",
                                ColorConstants.blue,
                                room.players
                                    .where((p) => p.team == TeamColor.BLUE)
                                    .toList()),
                            TeamCardWidget(
                                "User2",
                                ColorConstants.green,
                                room.players
                                    .where((p) => p.team == TeamColor.GREEN)
                                    .toList()),
                            TeamCardWidget(
                                "User2",
                                ColorConstants.red,
                                room.players
                                    .where((p) => p.team == TeamColor.RED)
                                    .toList()),
                            TeamCardWidget(
                                "User2",
                                ColorConstants.yellow,
                                room.players
                                    .where((p) => p.team == TeamColor.YELLOW)
                                    .toList()),
                          ],
                        )),
                  ],
                )),
            CardWidget(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          const Center(child: TextWidget(text: 'Время хода')),
                          TextField(
                            textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"\b([1-9]|[1-9][0-9])\b"))],
                            style: TextStyle(
                                color: ColorConstants.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                fontSize: TextSize.NORMAL.size),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstants.red,
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                              ),
                              labelText: null,
                              hintText: '80 сек.'
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CountWidget(text: 'Команды', color: ColorConstants.blue),
                      CountWidget(text: 'Размер поля', color: ColorConstants.green),
                      CountWidget(text: 'Белые карты', color: ColorConstants.yellow),
                      CountWidget(text: 'Черные карты', color: ColorConstants.red),
                      Spacer()
                    ],
                  ),
                ),
              ),
              color: ColorConstants.black,
            ),
          ],
        ));
  }
}



