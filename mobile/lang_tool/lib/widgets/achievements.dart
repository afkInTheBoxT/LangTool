import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/achievement.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';

// Achievements achievements;
// User curUserA = new User.withId(null, "name", "email", "password");

class Achievement extends StatefulWidget {
  Achievement({Key key, this.user}) : super(key: key);
  User user;

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  User curUser;
  List<Achievements> achievements;
  int userId;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    curUser = widget.user;
    userId = widget.user.id;
    getAchievement();
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: achievements == null
            ? Text("Empty")
            : ListView.builder(
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                achievements[index].name + "",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                achievements[index].description,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }));
  }

  // Widget _achievementsListItems() {
  //   return ListView.builder(
  //     itemCount: achievements.length,
  //     itemBuilder: (context, index) {
  //       return  Card(
  //         color: Colors.white,
  //         elevation: 2.0,
  //         child:ListTile(
  //           leading:Text(this.achievements[index].name),
  //           trailing: Icon(Icons.arrow_forward_ios),
  //         title:
  //             Text(this.achievements[index].description),
  //         onTap: () {
  //           // navigateToStudent(this.students[index]);
  //         },
  //       ));
  //     },
  //   );
  // }
  getAchievement() {
    APIServices.fetchUserAchievement(userId).then((response) {
      Iterable list = json.decode(response.body);
      List<Achievements> studentList = List<Achievements>();
      studentList =
          list.map((model) => Achievements.fromObject(model)).toList();
      setState(() {
        achievements = studentList;
        count = achievements.length;
      });
    });
  }
}
