import 'package:flutter/material.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/widgets/achievements.dart';
import 'package:lang_tool/widgets/deadline_picker.dart';
import 'package:lang_tool/widgets/statistics.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:lang_tool/models/widgetColors.dart';

class AccountPage extends StatefulWidget {
  AccountPage({this.curUser});
  User curUser;
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File _imageFile;
  final _picker = ImagePicker();
  var myFile = File('file.txt');
  @override
  Widget build(BuildContext context) {
    WidgetColor.changeColor();
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
                      backgroundColor: Colors.orange[400],
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
                            widget.curUser.name.toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            widget.curUser.email.toString(),
                            style: TextStyle(fontSize: 18),
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
                                  fontSize: 20,
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
                                  fontSize: 20,
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
                                    content: Statistics(),
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
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      // margin: const EdgeInsets.only(top: 20),
                      width: 150,
                      height: 60,
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
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            // The function showDialog<T> returns Future<T>.
                            // Use Navigator.pop() to return value (of type T).
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Статистика'),
                                content: DeadlinePicker(),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Встановити'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                  ),
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
}
