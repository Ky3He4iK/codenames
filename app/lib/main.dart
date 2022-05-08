import 'package:app/screens/GamePage.dart';
import 'package:app/screens/GamesPage.dart';
import 'package:app/screens/TeamPickPage.dart';
import 'package:flutter/material.dart';


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
      home: const GamesPage(),
      routes: <String, WidgetBuilder> {
        "/gameslist":(BuildContext context) => const GamesPage(),
        "/game":(BuildContext context) => const GamePage(),
        "/team":(BuildContext context) => const TeamPickPage(),
      },
    );
  }
}




