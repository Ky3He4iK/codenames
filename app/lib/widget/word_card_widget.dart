
import 'package:app/entity/entities.dart';
import 'package:app/style/colors.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class WordCard extends StatefulWidget {
  WordCard({
    Key? key,
    required this.card,
    required this.isOpened,
    required this.teamColor,
    required this.guesses,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);
  final CardInfo card;
  bool isOpened;
  final Color teamColor;
  int guesses;
  VoidCallback? onTap;
  VoidCallback? onLongPress;
  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState  extends State<WordCard>  {
  _WordCardState();
  bool isTappedByMe = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: Card(
          color: widget.isOpened ? widget.card.color.color : ColorConstants.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          child: Stack(
            children: [
              if(!widget.isOpened)
                Positioned(
                  top:0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        for (int i = 0; i < widget.guesses; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: widget.teamColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                )
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              Center(
                  child: TextWidget(
                    text: widget.card.text,
                    color: widget.isOpened ? widget.card.color.textColor : ColorConstants.black
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}