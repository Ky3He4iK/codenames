
import 'package:app/entity/color_extension.dart';
import 'package:app/entity/entities.dart';
import 'package:app/widget/text_field_widget.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class HintWidget extends StatelessWidget {

  HintWidget({
    Key? key,
    required this.hints,
    required this.isOpened,
    required this.teamColor
  }) : super(key: key);

  final List<Hint> hints;
  final GameColor teamColor;
  bool isOpened;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: isOpened ?
            SingleChildScrollView(
              child: Column(
                  children:  [
                    for(int l = 0; l < hints.length; l++)
                      TextWidget.s(hints[l].getText()),
                    if (hints.isEmpty) TextWidget.s("Слов нет")
                  ]
              ),
            ) :
            Center(child: TextWidget.s(hints.isNotEmpty ? hints.last.getText() : "Слов нет")),
          ),
          if (isOpened)
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // TextFieldWidget.c('Подсказка'),
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: FittedBox(
                      //     fit: BoxFit.fitWidth,
                      //     child: ElevatedButton(onPressed: () {},
                      //         style: ElevatedButton.styleFrom(primary: teamColor.color),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8),
                      //           child: TextWidget(text: "Отправить", color: teamColor.textColor, size: TextSize.SMALL),
                      //         )),
                      //   ),
                      // ),
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}