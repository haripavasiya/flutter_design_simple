import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class ColorResources {

  static Color getWhite(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);
  }
  static Color getBlack(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF000000) : Color(0xFF000000);
  }

  static const Color WHITE = Color(0xffFFFFFF);
  static const Color BLACK = Color(0xff000000);
  static const Color EVENT_BG = Color(0xffD9D9D9);
  static const Color COLOR_PRIMERY = Color(0xFFFF0000);
  static const Color LIGHT_COLOR_PRIMERY = Color(0xFFD9F3F9);
  static const Color HOLIDAY_PRIMERY = Color(0xFFF3692A);
  static const Color COLOR_BLUE = Color(0xff00ADEF);
  static const Color GREY = Color(0xff696969);
  static const Color Color_333333 = Color(0xff333333);
  static const Color SLIDER_BG = Color(0xffD4C9C9);
  static const Color LIGHT_GREY = Color(0xffC4C4C4);
  static const Color SERVICES_SELECT_BG = Color(0xffC5C5CC);
  static const Color RED = Color(0xFFFF0000);
  static const Color GREEN = Color(0xff689902);
  static const Color DARKGREEN = Color(0xff676733);
  static const Color LIGHTGREEN = Color(0xffCDCC00);
  static const Color HOLD_COLOR = Color(0xff5B655B);
  static const Color TRANSPARENT =Color(0xff00ECECEC);
  static const Color HINT_TEXT_COLOR = Color(0xff9E9E9E);
  static const Color PINK_COLOR = Color(0xffFF3368);
  static const Color DARKPINK_COLOR = Color(0xffFF01FF);
  static const Color BG_EDIT_TEXT = Color(0xffE8E8E8);
  static const Color BG_BOTTOM_MENU = Color(0xffC4C4C4);
  static const Color ORANGE = Color(0xffFE9901);
}
