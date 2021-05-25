import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/auth_page.dart';
import 'package:lang_tool/pages/main_page.dart';
import 'package:lang_tool/widgets/add_comment.dart';
import 'package:lang_tool/widgets/change_login.dart';
import 'package:lang_tool/widgets/change_password.dart';
import 'package:lang_tool/widgets/remove_account.dart';
import 'package:lang_tool/models/widgetColors.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.curUser}) : super(key: key);
  User curUser;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var passController = TextEditingController();
  var newPassController1 = TextEditingController();
  var newPassController2 = TextEditingController();
  var emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool isSwitched = WidgetColor.switchColor;
  @override
  Widget build(BuildContext context) {
    WidgetColor.changeColor();
    final buttonWidth = 240.0;
    final buttonHeight = 70.0;
    double textSize = 24.0;
    // Color buttonColor = Colors.orange[400];
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
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: buttonWidth,
            height: buttonHeight,
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
              onPressed: () {
                // The function showDialog<T> returns Future<T>.
                // Use Navigator.pop() to return value (of type T).
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Form(
                    key: _formKey,
                    child: AlertDialog(
                      title: const Text('Зміна паролю'),
                      content: ChangePass(
                        passController: passController,
                        newPassController1: newPassController1,
                        newPassController2: newPassController2,
                        user: curUserA,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Змінити'),
                          // onPressed: () => Navigator.pop(context, 'Cancel'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              changeUserPass(curUserA);
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
              onPressed: () {
                // The function showDialog<T> returns Future<T>.
                // Use Navigator.pop() to return value (of type T).
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Form(
                    key: _formKey,
                    child: AlertDialog(
                      title: const Text('Зміна логіну'),
                      content: ChangeLogin(
                        user: curUserA,
                        emailController: emailController,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Змінити'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              changeUserEmail(curUserA);
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
                            onPressed: () => {
                                  delUser(curUserA),
                                  Navigator.pop(context, 'Cancel'),
                                  Navigator.pop(context),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthPage()),
                                  ),
                                }),
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
                      WidgetColor.switchColor = isSwitched;
                      WidgetColor.index = 2;
                      print(isSwitched);
                      Navigator.pop(context);
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MainPage(
                                  curUser: curUserA,
                                )),
                      );
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
      ),
    );
  }

  void changeUserPass(User user) async {
    User user1 = new User.withId(
        user.id, user.name, user.email, newPassController2.text);
    var saveResponse = await APIServices.putUser(user1);
    try {
      saveResponse == true
          ? {Navigator.pop(context, true)}
          : {curUserA = user1, Scaffold.of(context)};
    } on Exception catch (e) {
      //Handle exception of type SomeException
    } catch (e) {
      //Handle all other exceptions
    }
  }

  void changeUserEmail(User user) async {
    User user1 = new User.withId(
        user.id, user.name, emailController.text, user.password);
    var saveResponse = await APIServices.putUser(user1);
    try {
      saveResponse == true
          ? {Navigator.pop(context, true)}
          : {curUserA = user1, Scaffold.of(context)};
    } on Exception catch (e) {
      //Handle exception of type SomeException
    } catch (e) {
      //Handle all other exceptions
    }
  }

  void delUser(User user) async {
    await APIServices.delUser(user);
    user = new User.withId(null, "name", "email", "password");
  }
}
