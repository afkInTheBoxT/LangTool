library lang_tool.testWidgets;

import 'package:flutter/material.dart';

class WidgetColor {
  static bool switchColor = false;

  static Color appBarTopColor;
  static Color appBarBotColor;

  static Color buttonTopColor;
  static Color buttonBotColor;

  static Color backgroundTop;
  static Color backgroundBot;

  static int index = 0;

  // WidgetColor(appBarTopColor, appBarBotColor, buttonTopColor, buttonBotColor);

  // static set newAppBarTopColor(Color newAppBarTopColor) {
  //   appBarTopColor = newAppBarTopColor;
  // }
  // static set newAppBarBotColor(Color newAppBarBotColor) {
  //   appBarBotColor = newAppBarBotColor;
  // }
  // static set newButtonTopColor(Color newButtonTopColor) {
  //   buttonTopColor = newButtonTopColor;
  // }
  // static set newbButtonBotColor(Color newbButtonBotColor) {
  //   buttonBotColor = newbButtonBotColor;
  // }

  static void changeColor() {
    if (!switchColor) {
      appBarTopColor = Color.fromARGB(255, 255, 193, 0);
      appBarBotColor = Color.fromARGB(255, 255, 168, 60);
      buttonTopColor = Color.fromARGB(255, 255, 193, 0);
      buttonBotColor = Color.fromARGB(255, 255, 168, 60);
      backgroundTop = Colors.white;
      backgroundBot = Colors.white;
    } else if (switchColor) {
      appBarTopColor = Colors.grey[900];
      appBarBotColor = Colors.purple;
      buttonTopColor = Colors.grey[900];
      buttonBotColor = Colors.purple;
      backgroundTop = Colors.grey[900];
      backgroundBot = Colors.grey[300];
    }
  }
}
