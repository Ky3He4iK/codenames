
import 'dart:io';

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
import 'package:flutter_svg/svg.dart';

class GamesPage extends StatefulWidget {
  const GamesPage() : super();
  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  late String username;
  late SquareButtonModel exitButtonModel;
  bool gameCreation = false;
  bool gameOpened = false;
  @override
  void initState() {
    exitButtonModel = SquareButtonModel('assets/images/exit.svg', ColorConstants.red, ColorConstants.white, () {
      exit(0);
    });

  }
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
                CardWidget(
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
                                    child: Image(image: AssetImage("assets/images/icon.png"))
                                ),
                              ),
                            Container(height: 20,),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorConstants.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: TextSize.NORMAL.size),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                                    ),
                                    labelText: null,
                                    hintText: 'User#1309'
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorConstants.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700,
                                      fontSize: TextSize.NORMAL.size),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                                      ),
                                      labelText: null,
                                      hintText: 'Код входа'
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamed(context, '/team');
                                },
                                    style: ElevatedButton.styleFrom(primary: ColorConstants.green),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextWidget(text: "Войти по коду", color: ColorConstants.white, enableFit: false),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: ElevatedButton(onPressed: () {
                                  setState(() {
                                    gameCreation = !gameCreation;
                                  });
                                  },
                                    style: ElevatedButton.styleFrom(primary: ColorConstants.red),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextWidget(text: gameCreation ? "Найти игру" : "Создать игру", color: ColorConstants.white, enableFit: false),
                                    )),
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    )
                ),
                if (!gameCreation)
                  CardWidget(
                    flex: 3,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: TextField(
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: ColorConstants.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                  fontSize: TextSize.NORMAL.size),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                                  ),
                                  labelText: null,
                                  hintText: 'Найти...'
                              ),
                            ),),
                            Expanded(flex: 5, child:
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (int i = 0; i < 20; i++)
                                    Row(children: [
                                      for (int j = 0; j < 2; j++)
                                      CardWidget(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextWidget(text: "Название", size: TextSize.HEADING_GAME),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                                    child: Row(
                                                      children: [
                                                        Expanded(child: SvgPicture.asset(
                                                          'assets/images/people.svg',
                                                          color: ColorConstants.black,
                                                          width: 50,
                                                          height: 50,
                                                        ),),
                                                        Expanded(child: TextWidget(text: "8", size: TextSize.BIG,)),
                                                        Spacer(flex: 2),
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            child: AspectRatio(
                                                              aspectRatio: 1,
                                                              child: Container(
                                                                color: ColorConstants.yellow,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(16.0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/pause.svg',
                                                                    color: ColorConstants.black,
                                                                    width: 20,
                                                                    height: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                        onTap: () {
                                          Navigator.pushNamed(context, '/team');
                                        },
                                      ),
                                    ],)
                                ],
                              ),
                            )),


                          ],
                        ),
                      ),
                    )
                )
                else
                  CardWidget(
                  flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextWidget(text: "Создание комнаты"),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                  fontSize: TextSize.NORMAL.size),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                                  ),
                                  labelText: null,
                                  hintText: 'Название игры'
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareButtonWidget(pic: "assets/images/open.svg", fun: () {
                                  setState(() {
                                    gameOpened = true;
                                  });
                                }, color: gameOpened ? ColorConstants.green : ColorConstants.grey, colorSvg: ColorConstants.white,),
                                Container(width: 20,),
                                SquareButtonWidget(pic: "assets/images/close.svg", fun: () {
                                  setState(() {
                                  gameOpened = false;
                                });
                                  }, color: !gameOpened ? ColorConstants.red : ColorConstants.grey,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
    );
  }

  CardWidget TopBar() {
    return  CardWidget(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TextWidget(text: "Codenames", size: TextSize.BIG,)),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SquareButtonWidget(
                    pic: exitButtonModel.picturePath,
                    color: exitButtonModel.buttonColor,
                    colorSvg: exitButtonModel.svgColor,
                    fun: exitButtonModel.fun,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
/***
    Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Expanded(child: TextWidget(text: "Название")),
    Column(
    children: [
    Row(
    children: [
    SvgPicture.asset(
    'assets/images/person.svg',
    color: ColorConstants.black,
    width: 50,
    height: 50,
    ),
    ],
    )
    ],
    )
    ],
    ),
 */