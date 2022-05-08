import 'dart:io';
import 'dart:math';

import 'package:app/style/colors.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/room_widget.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/text_field_widget.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage() : super();

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  late String username;
  bool gameCreation = false;
  bool gameOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopBar(),
            ContentRow(),
          ],
        ));
  }

  Expanded ContentRow() {
    return Expanded(
      flex: 4,
      child: Row(
        children: [
          BackMenuWidget(),
          if (!gameCreation) GameSearchWidget() else GameCreationWidget()
        ],
      ),
    );
  }

  CardWidget BackMenuWidget() {
    return CardWidget(
        flex: 1,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(image: AssetImage("assets/images/icon.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFieldWidget.c('User#1238'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFieldWidget.c('Код входа'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                        onPressed: () {Navigator.pushNamed(context, '/team');},
                        style: ElevatedButton.styleFrom(primary: ColorConstants.green),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: TextWidget(
                            text: "Войти по коду",
                            color: ColorConstants.white,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                        onPressed: () {setState(() {gameCreation = !gameCreation;});},
                        style: ElevatedButton.styleFrom(primary: ColorConstants.red),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextWidget(
                            text: gameCreation ? "Найти игру" : "Создать игру",
                            color: ColorConstants.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  CardWidget GameCreationWidget() {
    return CardWidget(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(text: "Создание комнаты"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldWidget.c('Название'),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareButtonWidget(
                    pic: "assets/images/open.svg",
                    fun: () {setState(() {gameOpened = true;});},
                    color: gameOpened ? ColorConstants.green : ColorConstants.grey,
                    colorSvg: ColorConstants.white,
                  ),
                  Container(width: 20),
                  SquareButtonWidget(
                    pic: "assets/images/close.svg",
                    fun: () {setState(() {gameOpened = false;});},
                    color: !gameOpened ? ColorConstants.red : ColorConstants.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, '/team');},
                  style: ElevatedButton.styleFrom(primary: ColorConstants.yellow),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextWidget(
                        text: "Создать комнату",
                        enableFit: false),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  CardWidget GameSearchWidget() {
    return CardWidget(
        flex: 3,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: TextFieldWidget(hintText: 'Найти...')),
                Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < 20; i++)
                            Row(
                              children: [
                                for (int j = 0; j < 2; j++)
                                  RoomWidget(
                                      name: "Название",
                                      isPaused: Random().nextBool(),
                                      usersCount: i % 11)
                              ]
                            )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  CardWidget TopBar() {
    return CardWidget(
        child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget.c("Codenames", TextSize.BIG,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SquareButtonWidget(
                pic: 'assets/images/exit.svg',
                color: ColorConstants.red,
                colorSvg: ColorConstants.white,
                fun: () {exit(0);},
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
