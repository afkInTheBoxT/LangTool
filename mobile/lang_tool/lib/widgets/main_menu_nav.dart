import 'package:flutter/material.dart';
import 'package:lang_tool/pages/alphabet_page.dart';
import 'package:lang_tool/pages/test_page.dart';
import 'package:lang_tool/pages/theme_page.dart';
import 'package:lang_tool/models/widgetColors.dart';

class MainMenuNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetColor.changeColor();
    double textSize = 24.0;
    // Color buttonColor = Colors.orange[400];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              WidgetColor.backgroundTop,
              WidgetColor.backgroundBot,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 280,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                          colors: [
                            WidgetColor.buttonTopColor,
                            WidgetColor.buttonBotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                    
                  ),
                ]
            ),
            child: FlatButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AplgabetPage()),
                );
              },
              child: Text(
                'Абетка',
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 280,
            height: 120,
            
            decoration: BoxDecoration(
              gradient: LinearGradient(
                          colors: [
                            WidgetColor.buttonTopColor,
                            WidgetColor.buttonBotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FlatButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemePage()),
                );
              },
              child: Text(
                'Фрази',
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 280,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                          colors: [
                            WidgetColor.buttonTopColor,
                            WidgetColor.buttonBotColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FlatButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage()),
                );
              },
              child: Text(
                'Тести',
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
