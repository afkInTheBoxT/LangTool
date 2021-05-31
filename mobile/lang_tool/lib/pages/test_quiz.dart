import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/Question.dart';
import 'package:lang_tool/models/answer.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/result.dart';
import 'package:lang_tool/models/test.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/models/widgetColors.dart';
import 'package:lang_tool/pages/test_page.dart';

class TestQuiz extends StatefulWidget {
  TestQuiz({Key key, this.testName, this.curUser}) : super(key: key);
  String testName;
  User curUser;

  @override
  _TestQuizState createState() => _TestQuizState();
}

class _TestQuizState extends State<TestQuiz> {
  List<String> corretAnswers = new List(4);
  List<Question> question;
  // Test test;
  List<Answer> answer;
  Result result;
  int index;
  int curIndex = 0;
  int state = 0;
  int state2 = 0;
  String txt = "Ви ще не відповіли на це запитання!";
  LinearGradient gradientBox = LinearGradient(
    colors: [
      WidgetColor.buttonTopColor,
      WidgetColor.buttonBotColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  LinearGradient gradientBoxCorrect = LinearGradient(
    colors: [
      Colors.green,
      Colors.green,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  @override
  Widget build(BuildContext context) {
    if (state < 10) {
      getQuestion();
      getAnswers();
      state++;
    }
    // if (state2 < 2) {
    //   postAnswers();
    //   state2++;
    // }
    // postAnswers();
    // for (; state2 < 10;) {
    //   // getQuestion();
    //   getAnswers();
    //   setState(() {
    //     state2++;
    //   });
    // }
    // for (; state1 < 10;) {
    //   getQuestion();
    //   // getAnswers();
    //   setState(() {
    //     state1++;
    //   });
    // }

    // curIndex = 0;
    // index = question.length;
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: question == null
                    ? Text(
                        "Empty",
                        textAlign: TextAlign.center,
                      )
                    : Container(
                        width: 280,
                        height: 120,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              question[curIndex].nameQuestion,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
              answer == null
                  ? Text("Empty")
                  : Center(
                      child: SizedBox(
                        height: 220,
                        width: 250,
                        child: ListView.builder(
                          itemCount: answer.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // constraints: ,
                              margin: const EdgeInsets.only(top: 6),
                              decoration: BoxDecoration(
                                gradient: gradientBox,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  print(answer[index].correctAnswer);
                                  corretAnswers[curIndex] =
                                      answer[index].correctAnswer;
                                  print(corretAnswers);
                                  checkAnswer();
                                  postAnswers();
                                },
                                // focusColor: Colors.green,
                                // onPressed: ,
                                child: Text(
                                    answer[index].correctAnswer.toString()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              Text(txt),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          if (curIndex > 0) {
                            curIndex--;
                          } else
                            curIndex = question.length - 1;
                          print("QW");
                        });
                        getAnswers();
                        checkAnswer();
                      }),
                  FlatButton(
                    onPressed: () {
                      // postAnswers();
                      setState(() {
                        state2 = 0;
                      });
                      print(result.toString());
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Form(
                          child: AlertDialog(
                            title: const Text('Результат проходження'),
                            content: result == null
                                ? Text("Ви не відповили не на одне запитання!")
                                : Container(
                                    width: 200,
                                    height: 200,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, //Center Row contents vertically,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center, //Center Column contents vertically,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center, //Center Column contents horizontally,
                                          children: [
                                            Text("Правильних відповідей: " +
                                                result.correctUserAnswers
                                                    .toString()),
                                            Text(result.currentMark.toString()),
                                            Text(result.totalMark.toString())
                                          ],
                                        ),
                                      ],
                                    )),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Закінчити проходження'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => TestPage(
                                  //             curUser: widget.curUser,
                                  //           )),
                                  // );
                                },
                              ),
                              // FlatButton(
                              //     child: Text('Пойти тест ще раз'),
                              //     onPressed: () {
                              //       Navigator.pop(context);
                              //       Navigator.pop(context);
                              //       MaterialPageRoute(
                              //           builder: (context) => TestQuiz(
                              //                 testName: "Food",
                              //                 curUser: widget.curUser,
                              //                 // answer: answer,
                              //                 // question: question,
                              //               ));
                              //     }),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Завершити тест",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          if (curIndex < question.length - 1) {
                            curIndex++;
                          } else
                            curIndex = 0;
                          print("QW");
                        });
                        getAnswers();
                        checkAnswer();
                      },
                    ),
                  ),
                ],
              ),
              answer == null
                  ? Text("")
                  : Text("Питання " +
                      (curIndex + 1).toString() +
                      " з " +
                      answer.length.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Future getQuestion() async {
    await APIServices.fetchQuestions(widget.testName).then((response) {
      Iterable list = json.decode(response.body);
      List<Question> studentList = List<Question>();
      studentList = list.map((model) => Question.fromObject(model)).toList();
      setState(() {
        question = studentList;
        // count = achievements.length;
      });
    });
  }

  Future getAnswers() async {
    await APIServices.fetchAnswers(question[curIndex].questionName)
        .then((response) {
      Iterable list = json.decode(response.body);
      List<Answer> studentList = List<Answer>();
      studentList = list.map((model) => Answer.fromObject(model)).toList();
      setState(() {
        answer = studentList;
        // count = achievements.length;
      });
      print("www");
    });
  }

  void checkAnswer() {
    String txt1;
    corretAnswers[curIndex] == null
        ? txt1 = "Ви ще не відповіли на це запитання!"
        : txt1 = "Ваша відповідь: " + corretAnswers[curIndex];
    setState(() {
      txt = txt1;
    });
  }

  Future postAnswers() async {
    await APIServices.postAnswers(
            widget.testName, widget.curUser.id.toString(), corretAnswers)
        .then((response) {
      var list = json.decode(response.body);
      Result studentList = new Result.fromJson(list);
      setState(() {
        result = studentList;
      });
    });
    // try {
    //   saveResponse == true
    //       ? Navigator.pop(context, true)
    //       : Scaffold.of(context);
    // } on Exception catch (e) {
    //   //Handle exception of type SomeException
    // } catch (e) {
    //   //Handle all other exceptions
    // }
  }
}
