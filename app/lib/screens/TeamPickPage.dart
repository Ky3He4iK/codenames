import 'package:app/entity/entities.dart';
import 'package:app/mocks/mocks.dart';
import 'package:app/style/colors.dart';
import 'package:app/ui_models/models.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/count_widget.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/team_card.dart';
import 'package:app/widget/text_field_widget.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamPickPage extends StatefulWidget {
  const TeamPickPage() : super();

  @override
  State<TeamPickPage> createState() => _TeamPickPageState();
}

class _TeamPickPageState extends State<TeamPickPage> {
  late Room room;
  List<GameColor> colors = TeamColorExtension.forTeams();
  List<SquareButtonModel> menuButtons = [];
  late SquareButtonModel gameModel;

  @override
  void initState() {
    super.initState();
    room = Mocks.getRoom();
    menuButtons = [
      SquareButtonModel('assets/images/restart.svg', ColorConstants.blue,
          ColorConstants.white, () {}),
      SquareButtonModel('assets/images/pause.svg', ColorConstants.yellow,
          ColorConstants.black, () {}),
      SquareButtonModel('assets/images/random.svg', ColorConstants.green,
          ColorConstants.white, () {}),
      SquareButtonModel(
          'assets/images/exit.svg', ColorConstants.red, ColorConstants.white,
          () {
        Navigator.pushNamed(context, '/gameslist');
      }),
    ];
    gameModel = SquareButtonModel(
        'assets/images/game.svg', ColorConstants.black, ColorConstants.white,
        () {
      Navigator.pushNamed(context, '/game');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: Row(
          children: [
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    topBar(),
                    teamsCards(),
                  ],
                )),
            settingsCard(),
          ],
        ));
  }

  CardWidget settingsCard() {
    return CardWidget(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                children: [
                  Center(child: TextWidget.n('Время хода (секунды)')),
                  TextFieldWidget(
                    isNumber: true,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"\b([1-9]|[1-9][0-9])\b"))
                    ],
                    hintText: '80 сек.',
                  ),
                ],
              ),
              const Spacer(),
              const CountWidget(text: 'Команды', color: ColorConstants.blue),
              const CountWidget(text: 'Размер поля', color: ColorConstants.green),
              const CountWidget(text: 'Белые карты', color: ColorConstants.yellow),
              const CountWidget(text: 'Черные карты', color: ColorConstants.red),
              const Spacer()
            ],
          ),
        ),
      ),
      color: ColorConstants.black,
    );
  }

  Expanded teamsCards() {
    return Expanded(
        flex: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < room.settings.teamsCount; i++)
              TeamCardWidget("User2", colors[i].color,
                  room.players.where((p) => p.team == colors[i]).toList()),
          ],
        ));
  }

  Expanded topBar() {
    return Expanded(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SquareButtonWidget(
            pic: gameModel.picturePath,
            color: gameModel.buttonColor,
            colorSvg: gameModel.svgColor,
            fun: gameModel.fun,
          ),
        ),
        CardWidget(
            child: Expanded(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget.b('Код:'),
                    ),
                    Tooltip(
                      message: 'Скопировано',
                      triggerMode: TooltipTriggerMode.tap,
                      child:
                          TextWidget.b(room.inviteCode),
                    )
                  ],
                )),
          ),
        )),
        CardWidget(
            child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < menuButtons.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SquareButtonWidget(
                      pic: menuButtons[i].picturePath,
                      color: menuButtons[i].buttonColor,
                      colorSvg: menuButtons[i].svgColor,
                      fun: menuButtons[i].fun,
                    ),
                  ),
              ],
            ),
          ),
        )),
      ]),
    );
  }
}

