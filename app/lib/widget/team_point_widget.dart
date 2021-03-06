import 'package:app/style/colors.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class TeamPoints extends StatelessWidget {
  const TeamPoints({
    Key? key,
    required this.color,
    required this.points,
    this.isLast = false,
    this.isFirst = false,
  }) : super(key: key);

  final Color color;
  final int points;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Column(
            children: [
              Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isFirst ? 10 : 0),
                        topRight: Radius.circular(
                            isLast ? 10 : 0),
                      )
                  )
              ),
              Expanded(child: Center(child: TextWidget(text: points.toString(), size: TextSize.BIG, color: color)))],),),
          if (!isLast)
            Container(
              height: double.infinity,
              width: 2,
              color: ColorConstants.black.withOpacity(0.2),
            )
        ],
      ),
    );
  }
}