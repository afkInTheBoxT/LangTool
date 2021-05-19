import 'package:flutter/material.dart';
import 'package:lang_tool/pages/main_page.dart';
import 'package:lang_tool/pages/reg_page.dart';

class AuthPage extends StatefulWidget {
  // final title;
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LangTool',
          ),
        ),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
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
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    // padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
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
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
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
                    height: 30,
                    // padding: const EdgeInsetsDirectional.only(bottom: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Забув пароль',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: const EdgeInsetsDirectional.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () => {},
                      // color: Colors.orange,
                      padding: EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/g_logo_auth.png',
                              )),
                          Flexible(
                            child: Text(
                              'Увійти за допомогою Google',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$');
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
