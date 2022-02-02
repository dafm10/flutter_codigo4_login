
import 'package:flutter/material.dart';

class ResponsiveUI{

  // late para que luego se le asigne un valor y no pida inicializar
  late double _height, _width;

  ResponsiveUI(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    this._height = size.height;
    this._width = size.width;
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;

}