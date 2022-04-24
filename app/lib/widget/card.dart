import 'package:flutter/material.dart';
import 'package:app/style/colors.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets insets;
  final int flex;
  final Widget child;
  final Color color;

  const CardWidget({
    Key? key,
    this.insets = const EdgeInsets.all(4),
    this.flex = 1,
    this.color = ColorConstants.white,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          padding: insets,
          child: Card(
              color: ColorConstants.white,
              shadowColor: Colors.blueGrey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                  )),
                  child,
                ],
              )),
        ));
  }
}
