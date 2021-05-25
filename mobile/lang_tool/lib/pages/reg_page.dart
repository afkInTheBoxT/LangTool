import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/auth_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:lang_tool/models/widgetColors.dart';

class RegPage extends StatefulWidget {
  RegPage({Key key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  List<User> users;
  User user = new User("", "", "");
  bool _checkUserBool;
  // _RegPageState();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var password1 = null;
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  final connectionIssurSnackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    // nameController.text;
    // emailController.text;
    // passController.text;
    // getUser();
    WidgetColor.changeColor();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LangTool',
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
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Реєстрація',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: emailController,
                      onChanged: (value) => this.checkUser(),
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
                        // checkUser();
                        if (!value.isValidEmail) {
                          return 'Невірно введена електронна адреса!';
                        } else {
                          if (!_checkUserBool) {
                            return 'Така адреса вже зареєстрована!';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: nameController,
                      onChanged: (value) => this.updateName(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelText: "Введіть ім`я",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (!value.isValidName) {
                          return 'Ім`я введено з помилкою';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
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
                            color: this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(
                                () => this._showPassword = !this._showPassword);
                          },
                        ),
                      ),
                      validator: (value) {
                        if (!value.isValidPassword) {
                          return 'Пароль повинен містити велику літеру та цифру';
                        }
                        password1 = value;
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: passController,
                      onChanged: (cvalue) => updatePass(),
                      obscureText: !this._showPassword,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Введіть пароль повторно',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(
                                () => this._showPassword = !this._showPassword);
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value != password1) {
                          return 'Невірно введен пароль!';
                        }
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // checkUser();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Реєстрація'),
                              content: Text('Реєстрація пройшла успішно!'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ок'),
                                  onPressed: () {
                                    saveUser();
                                    Navigator.pop(context, 'OK');
                                    }
                                ),
                              ],
                            ),
                          );
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        // print(users[0].name);
                        // users.forEach((element) {
                        //   print(element.name);
                        // });
                        // saveUser();
                        checkUser();
                      },
                      child: Text(
                        'Test',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // getUser() {
  //   APIServices.fetchUserEmail(emailController.text).then((response) {
  //     Iterable list = json.decode(response.body);
  //     List<User> userList = List<User>();
  //     userList = list.map((e) => User.fromObject(e)).toList();

  //     // print("Response status: ${response.statusCode}");
  //     // print("Response body: ${response.body}");

  //     setState(() {
  //       users = userList;
  //     });
  //     // }).catchError((error) {
  //     //               print("Error: $error");
  //   });
  // }

  void saveUser() async {
    User user1 = new User(
        nameController.text, emailController.text, passController.text);
    var saveResponse = await APIServices.postUser(user1);
    try {
      saveResponse == true
          ? Navigator.pop(context, true)
          : Scaffold.of(context).showSnackBar(connectionIssurSnackBar);
    } on Exception catch (e) {
      //Handle exception of type SomeException
    } catch (e) {
      //Handle all other exceptions
    }
  }

  void checkUser() async {
    User user1 = new User(
        nameController.text, emailController.text, passController.text);
    var saveResponse = await APIServices.getEmailUser(user1);

    print(saveResponse);
    if (saveResponse) {
      // saveUser();
      _checkUserBool = true;
    } else
      _checkUserBool = false;
    // saveUser();
  }

  void updateName() {
    user.name = nameController.text;
  }

  void updateEmail() {
    user.email = emailController.text;
  }

  void updatePass() {
    user.password = passController.text;
  }
}
