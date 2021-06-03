import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/deadline.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/main_page.dart';
import 'package:lang_tool/pages/test_page.dart';
import 'package:lang_tool/widgets/achievements.dart';
import 'package:lang_tool/widgets/deadline_picker.dart';
import 'package:lang_tool/widgets/statistics.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:lang_tool/models/widgetColors.dart';
import 'package:lang_tool/widgets/deadline_picker.dart';

import 'auth_page.dart';

// User curUserGlob;

class AccountPage extends StatefulWidget {
  AccountPage({this.curUser});
  User curUser;
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Deadline> deadlines;
  File _imageFile;
  final _picker = ImagePicker();
  var myFile = File('file.txt');
  int state = 0;
  @override
  Widget build(BuildContext context) {
    while (state < 3) {
      getDeadlines();
      state++;
    }
    WidgetColor.changeColor();
    curUserGlob = widget.curUser;
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
      child: ListView(children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: WidgetColor.buttonBotColor,
                      child: CircleAvatar(
                        radius: 58,
                        child: ClipOval(
                          child: (_imageFile != null)
                              ? Image.file(
                                  _imageFile,
                                  fit: BoxFit.cover,
                                  width: 116.0,
                                  height: 116.0,
                                )
                              : Image.asset(
                                  'assets/images/1.jpg',
                                  fit: BoxFit.cover,
                                  width: 116.0,
                                  height: 116.0,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 30,
                          child: Text(
                            curUserGlob.name.toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            curUserGlob.email.toString(),
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.photo_camera,
                                  size: 30,
                                ),
                                onPressed: () async => _pickImageFromCamera(),
                                tooltip: 'Shoot picture',
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.photo,
                                  size: 30,
                                ),
                                onPressed: () async => _pickImageFromGallery(),
                                tooltip: 'Pick from gallery',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 50,
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
                              child: Text(
                                'Досягнення',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                // The function showDialog<T> returns Future<T>.
                                // Use Navigator.pop() to return value (of type T).
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Досягнення'),
                                    content: Achievement(user: widget.curUser),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Поділитися'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                      ),
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Container(
                          // margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 50,
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
                              child: Text(
                                'Статистика',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                // The function showDialog<T> returns Future<T>.
                                // Use Navigator.pop() to return value (of type T).
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Статистика'),
                                    content: Statistics(
                                      curUser: widget.curUser,
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Поділитися'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                      ),
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          // margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 50,
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
                              child: Text(
                                'Встановити дедлайн',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                // The function showDialog<T> returns Future<T>.
                                // Use Navigator.pop() to return value (of type T).
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Встановлення дедлайну'),
                                    content: DeadlinePicker(
                                      curUser: widget.curUser,
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          child: Text('Встановити'),
                                          onPressed: () {
                                            if (testNameDeadLine != "" && startDate != "" && endDate != "") {
                                              Navigator.pop(context, 'Cancel');
                                              saveDeadline();
                                              setState(() {
                                                state = 0;
                                              });
                                            }
                                          }),
                                      FlatButton(
                                        child: Text('Скасувати'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 40),

                          // margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 50,
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
                              child: Text(
                                'Переглянути дедлайни',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  getDeadlines();
                                });

                                // The function showDialog<T> returns Future<T>.
                                // Use Navigator.pop() to return value (of type T).

                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Список дедлайнів'),
                                      content: Container(
                                        width: 700,
                                        height: 700,
                                        child: deadlines == null
                                            ? Text("Empty")
                                            : ListView.builder(
                                                itemCount: deadlines.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      Card(
                                                        child: Column(
                                                          children: [
                                                            Text("Назва теми: " +
                                                                deadlines[index]
                                                                    .topic),
                                                            Text("Дата початку: " +
                                                                deadlines[index]
                                                                    .dateStart),
                                                            Text("Дата закынчення: " +
                                                                deadlines[index]
                                                                    .dateEnd),
                                                            // Text("Статус завершення: " + deadlines[index].finished == false
                                                            // ? "не завешено"
                                                            // : "завершено"),
                                                            FlatButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  delUser(deadlines[
                                                                          index]
                                                                      .deadlineId);
                                                                  state = 0;
                                                                });

                                                                Navigator.pop(
                                                                    context,
                                                                    'Cancel');
                                                              },
                                                              child: Text(
                                                                "Вдалити",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text('Закрити'),
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            }),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  Future<void> _pickImageFromCamera() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  // Map<String, dynamic> toJson() {
  //   var map = Map<String, dynamic>();

  //   map["Topic"] = testName;
  //   map["DateStart"] = startDate;
  //   map["DateEnd"] = endDate;
  //   map["Finished"] = false;
  // }

  void saveDeadline() async {
    Map<String, dynamic> map = {
      "Topic": testNameDeadLine,
      "DateStart": startDate,
      "DateEnd": endDate,
      "Finished": false,
    };
    // map["Topic"] = testNameDeadLine;
    // map["DateStart"] = startDate;
    // map["DateEnd"] = endDate;
    // map["Finished"] = false;

    var saveResponse = await APIServices.postDeadline(map, widget.curUser.id);
    try {
      saveResponse == true
          ? Navigator.pop(context, true)
          : Scaffold.of(context);
    } on Exception catch (e) {
      //Handle exception of type SomeException
    } catch (e) {
      //Handle all other exceptions
    }
  }

  getDeadlines() async {
    await APIServices.fetchDeadlines(widget.curUser.id).then((response) {
      Iterable list = json.decode(response.body);
      List<Deadline> studentList = List<Deadline>();
      studentList = list.map((model) => Deadline.fromObject(model)).toList();

      if (this.mounted) {
        setState(() {
          deadlines = studentList;
        });
      }
    });
  }

  void delUser(int id) async {
    await APIServices.delDeadline(id);
    // user = new User.withId(null, "name", "email", "password");
  }

  // Future<Image> tinypng() async {
  //   String ppp = curUserGlobPhoto.photo;
  //   final bytes = Uint8List.fromList(curUserGlobPhoto.photo.ma);
  // // curUserGlobPhoto
  //   // copy from decodeImageFromList of package:flutter/painting.dart
  //   final codec = await instantiateImageCodec(bytes);
  //   final frameInfo = await codec.getNextFrame();
  //   return frameInfo.image;
  // }
}
