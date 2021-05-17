import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  ChangePass({Key key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView(
         children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 20),
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
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
                        setState(
                            () => this._showPassword = !this._showPassword);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: !this._showPassword,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Введіть ноий пароль',
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
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
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
                        setState(
                            () => this._showPassword = !this._showPassword);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
    );
  }
}