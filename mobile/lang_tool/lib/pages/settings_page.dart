import 'package:flutter/material.dart';
import 'package:lang_tool/widgets/add_comment.dart';
import 'package:lang_tool/widgets/change_login.dart';
import 'package:lang_tool/widgets/change_password.dart';
import 'package:lang_tool/widgets/remove_account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final buttonWidth = 240.0;
    final buttonHeight = 70.0;
    double textSize = 24.0;
    Color buttonColor = Colors.orange[400];
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FlatButton(
            onPressed: () {
              // The function showDialog<T> returns Future<T>.
              // Use Navigator.pop() to return value (of type T).
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Form(
                  key: _formKey,
                  child: AlertDialog(
                    title: const Text('Зміна паролю'),
                    content: ChangePass(),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Змінити'),
                        // onPressed: () => Navigator.pop(context, 'Cancel'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            return Navigator.pop(context, 'Cancel');
                          }
                        },
                      ),
                      FlatButton(
                        child: Text('Скасувати'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Змінити пароль',
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FlatButton(
            onPressed: () {
              // The function showDialog<T> returns Future<T>.
              // Use Navigator.pop() to return value (of type T).
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Form(
                  key: _formKey,
                  child: AlertDialog(
                    title: const Text('Зміна логіну'),
                    content: ChangeLogin(),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Змінити'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            return Navigator.pop(context, 'Cancel');
                          }
                          ;
                        },
                      ),
                      FlatButton(
                        child: Text('Скасувати'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Змінити логін',
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FlatButton(
            // onPressed: () {
            //   // Navigator.pop(context);
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => TestPage()),
            //   // );

            // },
            onPressed: () {
              // The function showDialog<T> returns Future<T>.
              // Use Navigator.pop() to return value (of type T).
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Form(
                  child: AlertDialog(
                    title: const Text('Видалення облікового запису'),
                    content: RemoveAccount(),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Видалити'),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                      ),
                      FlatButton(
                        child: Text('Скасувати'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Видалити обліковий запис',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: FlatButton(
            onPressed: () {
              // The function showDialog<T> returns Future<T>.
              // Use Navigator.pop() to return value (of type T).
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Form(
                  key: _formKey,
                  child: AlertDialog(
                    title: const Text('Відгук'),
                    content: AddComment(),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Відправити'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            return Navigator.pop(context, 'Cancel');
                          }
                        },
                      ),
                      FlatButton(
                        child: Text('Скасувати'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Залишити відгук',
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.brightness_7, size: 40),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              ),
              Icon(Icons.brightness_3_sharp, size: 40)
            ],
          ),
        ),
      ],
    );
  }
}
