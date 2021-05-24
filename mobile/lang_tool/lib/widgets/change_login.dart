import 'package:flutter/material.dart';
import 'package:lang_tool/models/api.services.dart';
import 'package:lang_tool/models/user.dart';

class ChangeLogin extends StatefulWidget {
  ChangeLogin({Key key, this.emailController, this.user}) : super(key: key);

  var emailController = TextEditingController(); 
  User user;

  @override
  _ChangeLoginState createState() => _ChangeLoginState();
}

class _ChangeLoginState extends State<ChangeLogin> {
  bool _checkUserBool;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
                // padding: const EdgeInsets.only(top: 30),
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: widget.emailController,
                  onChanged: (value) => print(widget.emailController.text),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Введіть новий логін',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                  if (!value.isValidEmail) {
                    return 'Логін введено з помилкою';
                  } else if(widget.user.email == widget.emailController.text) {
                    return 'Логін співпадає зі страим!';
                  }
                  // else if (widget.emailController.text == widget.user.email) {
                  //   return 'Такий логін вже існує!';
                  // }
                  // password1 = value;
                  return null;
                },
                ),
              ),
    );
  }

  void checkUser() async {
    User user1 = new User(widget.user.name, widget.emailController.text, widget.user.password);
    var saveResponse = await APIServices.getEmailUser(user1);

    print(saveResponse);
    if (saveResponse) {
      // saveUser();
      _checkUserBool = true;
    } else
      _checkUserBool = false;
    // saveUser();
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}