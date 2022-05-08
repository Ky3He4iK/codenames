import 'package:app/style/colors.dart';
import 'package:app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.isNumber = false,
    this.formatters,
    required this.hintText,
    this.size = TextSize.NORMAL,
  }) : super(key: key);

  TextFieldWidget.c(
    this.hintText,
  ) : super() {
    this.isNumber = false;
    this.size = TextSize.NORMAL;
  }
  late bool isNumber;
  List<FilteringTextInputFormatter>? formatters;
  String hintText;
  late TextSize size;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: isNumber ? TextInputType.number : null,
      inputFormatters: formatters,
      style: TextStyle(
          color: ColorConstants.black,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w200,
          fontSize: size.size
      ),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10))),
          labelText: null,
          hintText: hintText
      ),
    );
  }
}
