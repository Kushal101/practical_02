import 'package:flutter/cupertino.dart';
import 'color_theme.dart';

TextStyle({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
