import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              child: FittedBox(
                // fit: BoxFit.contain,
                child: Icon(Icons.brightness_3),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}