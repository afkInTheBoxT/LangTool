import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';
import 'package:lang_tool/pages/main_page.dart';
import 'package:lang_tool/pages/settings_page.dart';

class ChangePass extends StatefulWidget {
  // final _formKey = GlobalKey<FormState>();
  ChangePass({Key key, this.passController, this.newPassController1, this.newPassController2, this.user }) : super(key: key);

  var passController = TextEditingController();
  var newPassController1 = TextEditingController();
  var newPassController2 = TextEditingController();
  User user;

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
      width: 1000,
      height: 1000,
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20),
              // padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: widget.passController,
                onChanged: (value) => print(widget.passController.text),
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
                  if (curUserA.password != value) {
                    return 'Пароль не співпадає!';
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
                controller: widget.newPassController1,
                onChanged: (value) => print(widget.newPassController1.text),
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
                  } else if(curUserA.password == value) {
                    return 'Пароль схожий на страий!';
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
                controller: widget.newPassController2,
                onChanged: (value) => print(widget.newPassController2.text),
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

  // void changeUserPass(User user) async {
  //   User user1 = new User(user.name, user.email, widget.newPassController2.text);
  //   var saveResponse = await APIServices.putUser(user1);
  //   try {
  //     saveResponse == true
  //         ? Navigator.pop(context, true)
  //         : Scaffold.of(context);
  //   } on Exception catch (e) {
  //     //Handle exception of type SomeException
  //   } catch (e) {
  //     //Handle all other exceptions
  //   }
  // }
}

extension extString on String {
  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$');
    return passwordRegExp.hasMatch(this);
  }
}
