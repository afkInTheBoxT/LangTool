import 'package:flutter/material.dart';
import 'package:lang_tool/pages/alphabet_page.dart';
import 'package:lang_tool/pages/test_page.dart';
import 'package:lang_tool/pages/theme_page.dart';

class MainMenuNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double textSize = 24.0;
    Color buttonColor = Colors.orange[400];
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 280,
          height: 120,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
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
            color: buttonColor,
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
            color: buttonColor,
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
    );
  }
}
