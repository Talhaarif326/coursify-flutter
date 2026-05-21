import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/presentation/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  String fontFamily,
  Color color,
) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// get regular style

TextStyle getRegularStyle({
  double fontSize = FontSizeManager.size12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    FontFamily.fontFamily,
    color,
  );
}
// get medium style

TextStyle getMediumStyle({
  double fontSize = FontSizeManager.size12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    FontFamily.fontFamily,
    color,
  );
}
// get bold style

TextStyle getBoldStyle({
  double fontSize = FontSizeManager.size12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    FontFamily.fontFamily,
    color,
  );
}
// get semibold style

TextStyle getSemiBold({
  double fontSize = FontSizeManager.size12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    FontFamily.fontFamily,
    color,
  );
}
// get light style

TextStyle getLightStyle({
  double fontSize = FontSizeManager.size12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    FontFamily.fontFamily,
    color,
  );
}
