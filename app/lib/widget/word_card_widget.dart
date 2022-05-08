
import 'package:app/mocks/mocks.dart';
import 'package:app/ui_models/models.dart';
import 'package:app/widget/team_card.dart';
import 'package:app/widget/text_widget.dart';
import 'package:app/widget/word_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/widget/card.dart';
import 'package:app/style/colors.dart';
import 'package:app/entity/entities.dart';
import 'package:app/widget/square_button.dart';
import 'package:app/widget/count_widget.dart';
import 'package:app/widget/team_point_widget.dart';

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