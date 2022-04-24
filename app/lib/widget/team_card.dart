import 'package:flutter/material.dart';
import 'package:app/style/colors.dart';
import '../entity/entities.dart';
import 'card.dart';
import 'package:collection/collection.dart';

class TeamCardWidget extends StatelessWidget {
  final Color color;
  late List<String> team;
  String? captain;
  final String username;

  TeamCardWidget(
    this.username,
    this.color,
    List<Player> players,
  ) : super() {
    team = players
        .where((player) => player.role == UserRole.PLAYER)
        .map((e) => e.name)
        .toList();
    captain = players
        .firstWhereOrNull((player) => player.role == UserRole.CAPTAIN)
        ?.name;
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        color: color,
        child: Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamListWidget(captain: captain, team: team, username: username,),
              JoinWidget(team: team, username: username, color: color, captain: captain),
            ],
        )));
  }
}

class TeamListWidget extends StatelessWidget {
  const TeamListWidget({
    Key? key,
    required this.captain,
    required this.team,
    required this.username,
  }) : super(key: key);

  final String? captain;
  final List<String> team;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Капитан',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorConstants.black,
              fontStyle: FontStyle.italic,
              fontSize: 24),
        ),
        Text(
          captain != null ? captain == username ? '${captain!} (Вы)' : captain! : "Не занято",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorConstants.black,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 24),
        ),
        Text(
          'Команда',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: ColorConstants.black,
              fontStyle: FontStyle.italic,
              fontSize: 24),
        ),
        if (team.isNotEmpty)
        Column(
          children: [for (var i in team) Text(
            i == username ? '$i (Вы)' : i,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorConstants.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: 24),
          ),],
        )
        else
          Text(
            'Никого',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorConstants.greyDark,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: 24),
          ),
      ],
    );
  }
}

class JoinWidget extends StatelessWidget {
  const JoinWidget({
    Key? key,
    required this.team,
    required this.username,
    required this.color,
    required this.captain,
  }) : super(key: key);

  final List<String> team;
  final String username;
  final Color color;
  final String? captain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Войти как',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.black,
              fontStyle: FontStyle.italic,
              fontSize: 24),
        ),
        if (!team.contains(username))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: color),
              onPressed: () {},
              child: Text('Участник'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: color),
              onPressed: captain != null ? null : () {},
              child: Text('Капитан'),
            ),
          ),
      ],
    );
  }
}
