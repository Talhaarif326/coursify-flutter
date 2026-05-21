import 'package:flutter/material.dart';

// color manager class for the app
class ColorManager {
  static Color primary = HexColor.fromStringToHex('#3B7597');
  static Color darkGrey = HexColor.fromStringToHex("#525252");
  static Color grey = HexColor.fromStringToHex('#737477');
  static Color lightGrey = HexColor.fromStringToHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromStringToHex(
    '#B33B7597',
  );
  static Color darkPrimary = HexColor.fromStringToHex('#1F5070');
  static Color white = Colors.white;
  static Color error = HexColor.fromStringToHex('#FF0000');
}

// adding a method to color class using extension keyword
extension HexColor on Color {
  static Color fromStringToHex(String colorCode) {
    colorCode = colorCode.replaceAll('#', '');
    if (colorCode.length == 6) {
      colorCode = "FF$colorCode";
    }
    return Color(int.parse(colorCode, radix: 16));
  }
}
