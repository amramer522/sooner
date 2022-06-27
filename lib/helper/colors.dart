import 'package:flutter/material.dart';


var colorPrimary = const Color(0xff1E2147);

MaterialColor buildMaterialColor(int colorNumber) {
  Color color  =Color(colorNumber);
  List strengths = [.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
  final int r = color.red, g = color.green, b = color.blue;
  Map<int, Color> swatch = {};
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  // print("swatch: $swatch");
  return MaterialColor(color.value, swatch);
}