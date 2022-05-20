
import 'package:app/style/colors.dart';
import 'package:app/widget/card.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    Key? key,
    required this.name,
    required this.isPaused,
    required this.usersCount,
  }) : super(key: key);
  final String name;
  final bool isPaused;
  final int usersCount;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                TextWidget(text: name, size: TextSize.HEADING_GAME),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/images/people.svg',
                        color: ColorConstants.black,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child:
                        Container(
                          color: ColorConstants.blue,
                          child: TextWidget(
                            text: usersCount.toString(),
                            size: TextSize.HEADING_GAME,
                            color: ColorConstants.white,
                          ),
                        ),),
                    ),
                    const Spacer(flex: 2),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: isPaused
                              ? ColorConstants.yellow
                              : ColorConstants.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              isPaused
                                  ? 'assets/images/pause.svg'
                                  : 'assets/images/play.svg',
                              color: isPaused
                                  ? ColorConstants.black
                                  : ColorConstants.white,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, '/team');
      },
    );
  }
}
