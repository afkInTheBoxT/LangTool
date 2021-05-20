import 'package:flutter/material.dart';
import 'package:lang_tool/pages/test_quiz_page.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // static const _vertical = 20.0;
  // static const _horizontal = 10.0;
  // static const _iconSize = 70.0;
  // static const _textSize = 22.0;
  // static const _borderRadius = 20.0;

  // static Color _textColor = Colors.white;
  // static Color _backGroundColor = Colors.orange[400];
  // static Color _iconColor = Colors.white;

  // final _kPages = <Widget>[
  //   Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {
  //             // Navigator.pop(context);
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => TestPage()),
  //             );
  //           },
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.fastfood,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Їжа',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  //    Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {},
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.car_repair,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Транспорт',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  //    Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {},
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.question_answer_rounded,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Питання',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  //    Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {},
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.date_range_rounded,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Дати',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  //    Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {},
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.color_lens_rounded,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Кольори',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  //    Container(
  //     margin: const EdgeInsets.symmetric(
  //         vertical: _vertical, horizontal: _horizontal),
  //     decoration: BoxDecoration(
  //       color: _backGroundColor,
  //       borderRadius: BorderRadius.circular(_borderRadius),
  //     ),
  //     child: FlatButton(
  //       onPressed: () {},
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               Icons.emoji_nature,
  //               size: _iconSize,
  //               color: _iconColor,
  //             ),
  //             Text(
  //               'Природа',
  //               style: TextStyle(
  //                 fontSize: _textSize,
  //                 color: _textColor,
  //               ),
  //             ),
  //           ]),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    const _vertical = 20.0;
    const _horizontal = 10.0;
    const _iconSize = 70.0;
    const _textSize = 22.0;
    const _borderRadius = 20.0;

    Color _textColor = Colors.white;
    Color _backGroundColor = Colors.orange[400];
    Color _iconColor = Colors.white;

    final _kPages = <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(
            vertical: _vertical, horizontal: _horizontal),
        decoration: BoxDecoration(
          color: _backGroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: FlatButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
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
          color: _backGroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: FlatButton(
          onPressed: () {},
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
          color: _backGroundColor,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: FlatButton(
          onPressed: () {},
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
          color: _backGroundColor,
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
          color: _backGroundColor,
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
          color: _backGroundColor,
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Тести за темою',
          ),
          backgroundColor: _backGroundColor,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _kPages,
        ));
  }
}
