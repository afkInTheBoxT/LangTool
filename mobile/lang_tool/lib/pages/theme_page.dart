import 'package:flutter/material.dart';
import 'package:lang_tool/models/widgetColors.dart';
import 'package:lang_tool/pages/phrase_page.dart';
import 'package:get/get.dart';

class ThemePage extends StatefulWidget {
  ThemePage({Key key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  static const _vertical = 20.0;
  static const _horizontal = 10.0;
  static const _iconSize = 70.0;
  static const _textSize = 22.0;
  static const _borderRadius = 20.0;

  static Color _textColor = Colors.white;
  // static Color _backGroundColor = Colors.orange[400];
  static Color _iconColor = Colors.white;

  static String topicName = "";

  final _kPages = <Widget>[
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {
          topicName = "Їжа";
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasePage()),
          //   );
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhrasePage()));
          Get.to(PhrasePage(topicName: topicName,));
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Їжа',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {
          topicName = "Транспорт";
          Get.to(PhrasePage(topicName: topicName,));
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.car_repair,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Транспорт',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {
          topicName = "Питання";
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasePage()),
          //   );
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhrasePage()));
          Get.to(PhrasePage(topicName: topicName,));
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.question_answer_rounded,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Питання',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.date_range_rounded,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Дати',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.color_lens_rounded,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Кольори',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
          vertical: _vertical, horizontal: _horizontal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetColor.buttonTopColor,
            WidgetColor.buttonBotColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.emoji_nature,
                size: _iconSize,
                color: _iconColor,
              ),
              Text(
                'Природа',
                style: TextStyle(
                  fontSize: _textSize,
                  color: _textColor,
                ),
              ),
            ]),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetColor.changeColor();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Фрази за темою',
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      WidgetColor.appBarTopColor,
                      WidgetColor.appBarBotColor,
                    ]),
                ),
          ),
        ),
        body: Container(
          color: WidgetColor.backgroundTop,
          child: GridView.count(
            crossAxisCount: 2,
            children: _kPages,
          ),
        ));
  }
}
