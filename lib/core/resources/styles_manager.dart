import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s20,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

TextStyle getRegularStyle2(
    {double fontSize = FontSize.s16,
    required Color color,
    String fontFamily = FontConstants.fontFamily2}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

TextStyle getRegularStyle3(
    {double fontSize = FontSize.s20,
    required Color color,
    String fontFamily = FontConstants.fontFamily2}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

TextStyle getRegular(
    {double fontSize = FontSize.s14,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

TextStyle getRegular2(
    {double fontSize = FontSize.s14,
    required Color color,
    String fontFamily = FontConstants.fontFamily2}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}




TextStyle getMediumStyle(
    {double fontSize = FontSize.s24,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily);
}

// medium style

TextStyle getBigMediumStyle(
    {double fontSize = FontSize.s36,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s20,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

TextStyle getBoldStyle2(
    {double fontSize = FontSize.s20,
    required Color color,
    String fontFamily = FontConstants.fontFamily2}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

TextStyle getBoldTitleStyle(
    {double fontSize = FontSize.s24,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

TextStyle getBoldTitleStyle2(
    {double fontSize = FontSize.s24,
    required Color color,
    String fontFamily = FontConstants.fontFamily2}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}
// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s20,
    required Color color,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}

TextStyle getTextWithLine() {
  return TextStyle(
    color: ColorManager.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    decorationColor: ColorManager.primary,
  );
}
