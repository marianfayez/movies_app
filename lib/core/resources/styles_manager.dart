import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style
TextStyle getSmallStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getRegular(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color );
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

