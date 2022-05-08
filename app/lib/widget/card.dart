import 'package:app/style/colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets insets;
  final int flex;
  final Widget child;
  final Color? color;
  final Color? backgroundColor;
  final Function? onTap;
  final Function? onLongPress;

  const CardWidget({
    Key? key,
    this.insets = const EdgeInsets.all(4),
    this.flex = 1,
    this.color,
    this.backgroundColor = ColorConstants.white,
    required this.child,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: GestureDetector(
          onTap: () { onTap != null ? onTap!() : {};},
          onLongPress: () { onLongPress != null ? onLongPress!() : {};},
          child: Container(
            padding: insets,
            child: Card(
                color: backgroundColor,
                shadowColor: Colors.blueGrey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    if (color != null)
                    Container(
                      height: 20,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                    )),
                    child,
                  ],
                )),
          ),
        ));
  }
}
