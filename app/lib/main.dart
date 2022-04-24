import 'package:app/widget/team_card.dart';
import 'package:flutter/material.dart';
import 'widget/card.dart';
import 'widget/team_card.dart';
import 'style/colors.dart';
import 'entity/entities.dart';
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
        4, 60, 30, 5, 5,
      ),
      [
        Player(
          1, "User1", TeamColor.BLUE, UserRole.CAPTAIN,
        ),
        Player(
          2, "User2", TeamColor.BLUE, UserRole.PLAYER,
        ),
        Player(
          3, "User3", TeamColor.BLUE, UserRole.PLAYER,
        ),
        Player(
          4, "User4", TeamColor.RED, UserRole.CAPTAIN,
        ),
        Player(
          5, "User5", TeamColor.RED, UserRole.PLAYER,
        ),
        Player(
          6, "User6", TeamColor.YELLOW, UserRole.PLAYER,
        ),
        Player(
          7, "User7", TeamColor.YELLOW, UserRole.PLAYER,
        ),
        Player(
          8, "User8", TeamColor.YELLOW, UserRole.PLAYER,
        ),
        Player(
          8, "User9", TeamColor.GREEN, UserRole.CAPTAIN,
        ),
      ],
      Player(
        1, "User1", TeamColor.BLUE, UserRole.CAPTAIN,
      ),
      "FFFFF",
      0,
      "TestRoom",
      null
  );

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
                    const CardWidget(child: Text("ТУТ БУДУТ КНОПОЧКИ")),
                    Expanded(
                        flex: 4,
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TeamCardWidget(
                                    "User1",
                                    ColorConstants.blue,
                                  room.players.where((p) => p.team == TeamColor.BLUE).toList()
                                ),
                                TeamCardWidget(
                                    "User1",
                                    ColorConstants.green,
                                    room.players.where((p) => p.team == TeamColor.GREEN).toList()
                                ),
                                TeamCardWidget(
                                    "User1",
                                    ColorConstants.red,
                                    room.players.where((p) => p.team == TeamColor.RED).toList()
                                ),
                                TeamCardWidget(
                                    "User1",
                                    ColorConstants.yellow,
                                    room.players.where((p) => p.team == TeamColor.YELLOW).toList()
                                ),
                              ],
                            )),
                  ],
                )),
            CardWidget(child: Text("ТУТ БУДУТ НАСТРОЕЧКИ"), color: ColorConstants.black,),
          ],
        ));
  }
}
