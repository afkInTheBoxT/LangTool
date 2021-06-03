import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';

// List<int> stats;

int testCount = 10;
int achievCount = 3;
int themeCount = 1;
int phrasesCount = 5;
double alphabetProgress = 22.1;
// Map<String, double> stats = {
//   "Кількість пройдених тестів": testCount,
//   "Кількісь отрманих досягнень": achievCount,
//   "Кількість завершених тем": themeCount,
//   "Кількість вивених фраз": phrasesCount,
//   "Прогрес абетки": alphabetProgress,
// };

class Statistics extends StatefulWidget {
  Statistics({Key key, this.curUser}) : super(key: key);
  User curUser;

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int passedTests;
  int gainedAchievements;
  int completedTopics;
  int totalLearnedPhrases;
  double alphabetProgress;
  List<String> stats1;
  @override
  Widget build(BuildContext context) {
    // print(stats.toString());

    for (int i = 0; i < 1; i++) {
      getPassedTests();
      getGainedAchievements();
      getCompletedTopics();
      getTotalLearnedPhrases();
      getAlphabetProgress();
    }
    // postAnswers();
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment
                  .center, //Center Column contents horizontally,
              children: [
                Card(child: Text("Пройдено тестів: " + passedTests.toString())),
                Card(
                    child: Text("Отримано досягнень: " +
                        gainedAchievements.toString())),
                Card(
                    child: Text("Пройдено тем: " + completedTopics.toString())),
                Card(
                    child: Text(
                        "Вивчено фраз: " + totalLearnedPhrases.toString())),
                // Card(
                //     child:
                //         Text("Прогрес абетки: " + alphabetProgress.toString())),
              ],
            )
          ],
        ));
  }

  getPassedTests() async {
    await APIServices.fetchPassedTests(widget.curUser.id).then((response) {
      var list = json.decode(response.body);
      int studentList = list;
      if (this.mounted) {
        setState(() {
          passedTests = studentList;
        });
      }
    });
  }

  getGainedAchievements() async {
    await APIServices.fetchGainedAchievements(widget.curUser.id)
        .then((response) {
      var list = json.decode(response.body);
      int studentList = list;
      if (this.mounted) {
        setState(() {
          gainedAchievements = studentList;
        });
      }
    });
  }

  getCompletedTopics() async {
    await APIServices.fetchCompletedTopics(widget.curUser.id).then((response) {
      var list = json.decode(response.body);
      int studentList = list;
      if (this.mounted) {
        setState(() {
          completedTopics = studentList;
        });
      }
    });
  }

  getTotalLearnedPhrases() async {
    await APIServices.fetchTotalLearnedPhrases(widget.curUser.id)
        .then((response) {
      var list = json.decode(response.body);
      int studentList = list;
      if (this.mounted) {
        setState(() {
          totalLearnedPhrases = studentList;
        });
      }
    });
  }

  getAlphabetProgress() async {
    await APIServices.fetchAlphabetProgress(widget.curUser.id).then((response) {
      var list = json.decode(response.body);
      double studentList = list;
      if (this.mounted) {
        setState(() {
          alphabetProgress = studentList;
        });
      }
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }
}
