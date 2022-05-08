
import 'package:app/entity/entities.dart';
import 'package:app/style/colors.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/word_card_widget.dart';
import 'package:flutter/material.dart';

class CardsField extends StatelessWidget {
  CardsField({
    Key? key, required this.cards
  }) : super(key: key) {
    if (cards.length % 7 == 0){
      cardsInRow = 7;
    } else if (cards.length % 6 == 0){
      cardsInRow = 6;
    } else if (cards.length % 5 == 0){
      cardsInRow = 5;
    } else {
      cardsInRow = 4;
    }
    rowCount = cards.length ~/ cardsInRow;
  }
  final List<CardInfo> cards;
  late int cardsInRow;
  late int rowCount;
  @override
  Widget build(BuildContext context) {
    return CardWidget(flex: 4, child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < rowCount; i++)
              Expanded(
                child: Row(
                  children: [
                    for (int j = 0; j < cardsInRow; j++)
                      WordCard(card: cards[i*cardsInRow + j], isOpened: cards[i*cardsInRow + j].isOpened, teamColor: ColorConstants.blue, guesses: cards[i*cardsInRow + j].choicedUsers.length,),
                  ],
                ),
              )
          ],
        ),
      ),
    ));
  }
}

