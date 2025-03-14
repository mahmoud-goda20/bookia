import 'package:bookia/core/constans/app_const.dart';
import 'package:flutter/material.dart';


TextStyle getHeadLineTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: AppConst.fontFamily,
    fontSize: fontSize ?? 30,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
TextStyle getTitleTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: AppConst.fontFamily,
    fontSize: fontSize ?? 24,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: AppConst.fontFamily,
    fontSize: fontSize ?? 18,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getSmallTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: AppConst.fontFamily,
    fontSize: fontSize ?? 14,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
