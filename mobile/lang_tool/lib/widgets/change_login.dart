import 'package:flutter/material.dart';

class ChangeLogin extends StatefulWidget {
  ChangeLogin({Key key}) : super(key: key);

  @override
  _ChangeLoginState createState() => _ChangeLoginState();
}

class _ChangeLoginState extends State<ChangeLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
                // padding: const EdgeInsets.only(top: 30),
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Введіть новий логін',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
    );
  }
}