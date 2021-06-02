import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color redLight = Color(0xffF8896C);
  final Color red = Color(0xffFA604E);
  final Color yellow = Color(0xffFCD435);
  final Color yellowLight = Color(0xffFCF2D4);
  final Color grey = Color(0xffA9A9A9);
  final Color greyLight100 = Color(0xffD1D1D1);
  final Color greyLight200 = Color(0xffF0F0F0);
  final Color greyLight300 = Color(0xffF4F4F4);
  final Color white = Color(0xffffffff);
  final Color black = Color(0xff3C3C3C);
}
