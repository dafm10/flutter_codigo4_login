
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_codigo4_login/ui/general/fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;

  TextWidget({
    required this.text,
    this.colorText,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colorText,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;

  H1({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: H1_SIZE,
      colorText: COLOR_FONT_PRIMARY,
      fontWeight: FontWeight.bold,
    );
  }
}

class H2 extends StatelessWidget {
  final String text;

  H2({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: H2_SIZE,
      colorText: COLOR_FONT_PRIMARY,
      fontWeight: FontWeight.bold,
    );
  }
}

class H3 extends StatelessWidget {
  final String text;

  H3({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: H3_SIZE,
      colorText: COLOR_FONT_PRIMARY,
      fontWeight: FontWeight.w400,
    );
  }
}

class H6 extends StatelessWidget {
  final String text;

  H6({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: H6_SIZE,
      colorText: COLOR_FONT_PRIMARY,
      fontWeight: FontWeight.w400,
    );
  }
}

class H6Bold extends StatelessWidget {
  final String text;

  H6Bold({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: H6_SIZE,
      colorText: COLOR_FONT_PRIMARY,
      fontWeight: FontWeight.bold,
    );
  }
}

