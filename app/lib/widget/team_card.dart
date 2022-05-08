import 'package:app/style/colors.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:app/entity/entities.dart';
import 'card.dart';
import 'text_widget.dart';

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
              TeamListWidget(captain: captain, team: team, username: username, color: color),
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
    required this.color,
  }) : super(key: key);

  final String? captain;
  final List<String> team;
  final String username;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: 'Капитан',
          size: TextSize.SMALL
        ),
        TextWidget.n(
          captain != null
          ? captain == username ? '${captain!} (Вы)' : captain!
          : "Не занято"
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(color: color)
          ),
        ),
        TextWidget.s('Команда'),
        if (team.isNotEmpty)
          Column(
            children: [
              for (var i in team)
                TextWidget.n(i == username ? '$i (Вы)' : i)
            ],
          )
        else
          const Text(
            'Никого',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorConstants.greyDark,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 30),
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
        const Text(
          'Войти как',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.black,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontSize: 20),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: ButtonWidget(color: color, text: 'Участник', fun: !team.contains(username) ? () {} : null),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
            child: ButtonWidget(color: color, text: 'Капитан', fun: captain != null ? null : () {}),
          ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.fun,
  }) : super(key: key);

  final Color color;
  final String text;
  final VoidCallback? fun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: fun,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: ColorConstants.white,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontSize: 30),
        ),
      ),
    );
  }
}
