import 'package:flutter/material.dart';
import 'package:lang_tool/pages/settings_page.dart';

class ChangePass extends StatefulWidget {
  // final _formKey = GlobalKey<FormState>();
  ChangePass({Key key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  // final _formKey = GlobalKey<FormState>();
  var oldPass = 'Qwer1';
  var newPass1 = null;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20),
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                obscureText: !this._showPassword,
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  labelText: 'Введіть старий пароль',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (oldPass != value) {
                    return 'Пароль повинен містити велику літеру та цифру';
                  }
                  // password1 = value;
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
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  labelText: 'Введіть новий пароль',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (!value.isValidPassword) {
                    return 'Пароль повинен містити велику літеру та цифру';
                  }
                  // password1 = value;
                  newPass1 = value;
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
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  labelText: 'Повторно введіть новий пароль',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (value != newPass1) {
                    return 'Пароль не співпадає';
                  }
                  // password1 = value;
                  return null;
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

extension extString on String {
  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$');
    return passwordRegExp.hasMatch(this);
  }
}
