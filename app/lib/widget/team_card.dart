import 'package:flutter/material.dart';
import 'package:app/style/colors.dart';
import 'card.dart';

class TeamCardWidget extends StatelessWidget {
  final Color color;
  final List<String> team;
  final String? captain;
  final String username;
  const TeamCardWidget({
    Key? key,
    required this.team,
    required this.username,
    this.captain,
    this.color = ColorConstants.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(color: color,
      child: Column(
        children: [
          Text("Капитан"),
          Text(captain != null ? captain! : "Не занято"),
          Text("Команда"),
          Column(
            children: [
              for ( var i in team ) Text(i)
            ],
          ),
          Text("Войти как"),
          if (!team.contains(username))
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red, // foreground
              ),
              onPressed: () { },
              child: const Text('Участник'),
            ),
          if (captain == null)
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red, // foreground
              ),
              onPressed: () { },
              child: const Text('Капитан'),
            ),
        ],
      )
    );

  }
}
