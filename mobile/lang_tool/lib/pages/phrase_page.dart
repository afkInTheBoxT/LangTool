import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/phrase.dart';
import 'package:lang_tool/models/widgetColors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';
import 'package:lang_tool/pages/account_page.dart';

import 'auth_page.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class PhrasePage extends StatefulWidget {
  PhrasePage({Key key, this.topicName}) : super(key: key);
  String topicName;

  @override
  _PhrasePageState createState() => _PhrasePageState();
}

class _PhrasePageState extends State<PhrasePage> {
  bool _displayFront;
  bool _flipXAxis;

  Phrase phrase1 = new Phrase("Topic1", "Phrase1", "Japan1", "Ru1");
  Phrase phrase2 = new Phrase("Topic2", "Phrase2", "Japan2", "Ru2");
  List<Phrase> phrases;
  int curIndex = 0;
  int state = 0;
  bool statePhrase = true;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    // while(state == 0){
    //   List<Phrase> phrases1 = new List<Phrase>();
    //   phrases1.add(phrase1);
    //   phrases1.add(phrase2);
    //   phrases = phrases1;
    //   state++;
    // }
    while (state < 2) {
      getPhrases();
      state++;
    }
    // List<Phrase> phrases = new List<Phrase>();
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: phrases == null
                      ? Text(
                          "Empty",
                          textAlign: TextAlign.center,
                        )
                      : FlipCard(

                          direction: FlipDirection.VERTICAL,
                          key: cardKey,
                          front: Container(
                            width: 280,
                            height: 120,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Column contents vertically,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, //Center Column contents horizontally,
                                    children: [
                                      // Text(
                                      //   phrases[curIndex].phraseName,
                                      // ),
                                      Text(
                                        phrases[curIndex].japanesePhraseName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
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
                          back: Container(
                            width: 280,
                            height: 120,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Column contents vertically,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        phrases[curIndex].translatePhraseName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
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
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            if (curIndex > 0) {
                              curIndex--;
                            } else
                              curIndex = phrases.length - 1;
                            print("QW");
                          });
                          // getAnswers();
                          // checkAnswer();
                        }),
                    FlatButton(
                      onPressed: () {
                        // postAnswers();
                        // setState(() {
                        //   state2 = 0;
                        // });
                        // print(result.toString());
                        Get.back();
                      },
                      child: Text(
                        "Завершити вивчення фраз",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            if (curIndex < phrases.length - 1) {
                              curIndex++;
                              if(curIndex == phrases.length - 1){
                                getAchievementComplteTopic();
                              }
                            } else
                              curIndex = 0;
                            print("QW");
                          });
                          // getAnswers();
                          // checkAnswer();
                        },
                      ),
                    ),
                  ],
                ),
                phrases == null
                    ? Text("")
                    : Text("Фраза " +
                        (curIndex + 1).toString() +
                        " з " +
                        phrases.length.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getPhrases() async {
    await APIServices.fetchPhrases(widget.topicName).then((response) {
      Iterable list = json.decode(response.body);
      List<Phrase> studentList = List<Phrase>();
      studentList = list.map((model) => Phrase.fromObject(model)).toList();
      setState(() {
        phrases = studentList;
        // count = achievements.length;
      });
      print("www");
    });
  }

  void getAchievementComplteTopic() async {
    await APIServices.getAchievementComplteTopic(widget.topicName, curUserGlob.id);
  }
}
