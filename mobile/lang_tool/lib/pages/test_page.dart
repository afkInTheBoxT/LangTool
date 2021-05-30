import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/Question.dart';
import 'package:lang_tool/models/answer.dart';
import 'package:lang_tool/models/test.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/test_quiz.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key, this.curUser}) : super(key: key);
  User curUser;

  @override
  _TestPageState createState() => _TestPageState();
}

List<Question> question;
  Test test;
  List<Answer> answer;
  String testName;

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
            // setState(() {
            //   testName = "Food";
            // });
            // getQuestion();
            // getAnswers();
            // // Navigator.pop(context);
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => HomePage()),
              MaterialPageRoute(builder: (context) => TestQuiz(
                testName: "Food",
                curUser: widget.curUser,
                // answer: answer,
                // question: question,
                )),
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

void getQuestion() async {
    await APIServices.fetchQuestions(testName).then((response) {
      Iterable list = json.decode(response.body);
      List<Question> studentList = List<Question>();
      studentList = list.map((model) => Question.fromObject(model)).toList();
        question = studentList;
        // count = achievements.length;
    });

    await APIServices.fetchAnswers(question[0].questionName).then((response) {
      Iterable list = json.decode(response.body);
      List<Answer> studentList = List<Answer>();
      studentList = list.map((model) => Answer.fromObject(model)).toList();
        answer = studentList;
        // count = achievements.length;
    });
  }

  void getAnswers() {
    
  }
