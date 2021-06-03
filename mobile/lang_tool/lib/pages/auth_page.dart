import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/main_page.dart';
import 'package:lang_tool/pages/reg_page.dart';
import 'package:lang_tool/models/widgetColors.dart';

User curUserGlob;

class AuthPage extends StatefulWidget {
  // final title;
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // widget_colors wdgC;
  bool _checkUserBool;
  // _RegPageState();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  // List<User> user;
  User user = new User.withId(null, "null", "null", "null");
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    WidgetColor.changeColor();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LangTool',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                WidgetColor.appBarTopColor,
                WidgetColor.appBarBotColor,
              ])),
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Авторизація',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      // padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          this.checkUser();
                          this.getUser();
                        },
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Введіть електронну адресу',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (!value.isValidEmail) {
                            return 'Невірно введена електронна адреса!';
                          } else if (_checkUserBool)
                            return 'Невірно введена електронна адреса!';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      // padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: passController,
                        obscureText: !this._showPassword,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Введіть пароль',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  this._showPassword ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                  () => this._showPassword = !this._showPassword);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (!value.isValidPassword) {
                            return 'Невірно введен пароль!';
                          } else if (passController.text != getUserPass())
                            return 'Невірно введен пароль!';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(top: 20),
                      width: 180,
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
                        // boxShadow: ,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () {
                          // getUser();
                          if (_formKey.currentState.validate()) {
                            print('UserList:' + user.toString());
                            print('userPass');
                            print(getUserPass());
                            // curUserGlob = cur
                            if (passController.text == getUserPass()) {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage(
                                          curUser: user,
                                        )),
                              );
                            } else
                              print("notFindPass");
                          }
                        },
                        child: Text(
                          'Увійти',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 30,
                    //   // padding: const EdgeInsetsDirectional.only(bottom: 10),
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Забув пароль',
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.blue,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   width: 200,
                    //   margin: const EdgeInsetsDirectional.only(top: 10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     // color: Colors.orange,
                    //     gradient: LinearGradient(
                    //       colors: [
                    //         WidgetColor.buttonTopColor,
                    //         WidgetColor.buttonBotColor,
                    //       ],
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //     ),
                    //   ),
                    //   // ignore: deprecated_member_use
                    //   child: FlatButton(
                    //     onPressed: () => {},
                    //     padding: EdgeInsets.all(0.0),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       // Replace with a Row for horizontal icon + text
                    //       children: <Widget>[
                    //         IconButton(
                    //             onPressed: () {},
                    //             icon: Image.asset(
                    //               'assets/images/g_logo_auth.png',
                    //             )),
                    //         Flexible(
                    //           child: Text(
                    //             'Увійти за допомогою Google',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 30,
                      // padding: const EdgeInsetsDirectional.only(bottom: 10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegPage()),
                          );
                        },
                        child: Text(
                          'Створити акаунт',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getUser() async {
    if (true) {
      APIServices.fetchUserEmail(emailController.text).then((response) {
        var list = json.decode(response.body);
        User user2 = new User.fromJson(list);
        // List<User> userList;
        // userList = list.map((model) => User.fromJson(model)).toList();
        // user = userList;
        // return user;
        // count = students.length;
        user = user2;
        curUserGlob = user;
      });
    } else
      print("NotFind");
  }

  String getUserPass() {
    return user.password;
  }

  void checkUser() async {
    User user1 = new User(
        nameController.text, emailController.text, passController.text);
    var saveResponse = await APIServices.getEmailUser(user1);
    print(saveResponse);
    if (saveResponse) {
      _checkUserBool = true;
    } else
      _checkUserBool = false;
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = new RegExp(r"^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
