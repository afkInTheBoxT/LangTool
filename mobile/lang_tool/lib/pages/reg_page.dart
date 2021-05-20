import 'package:flutter/material.dart';
import 'package:lang_tool/pages/auth_page.dart';

class RegPage extends StatefulWidget {
  RegPage({Key key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  var password1 = null;
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LangTool',
        ),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
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
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Реєстрація'),
                            content: Text('Реєстрація пройшла успішно!'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ок'),
                                onPressed: () => Navigator.pop(context, 'OK'),
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
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
