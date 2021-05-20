import 'package:flutter/material.dart';
import 'package:lang_tool/pages/account_page.dart';

class AplgabetPage extends StatefulWidget {
  AplgabetPage({Key key}) : super(key: key);

  @override
  _AplgabetPageState createState() => _AplgabetPageState();
}

class _AplgabetPageState extends State<AplgabetPage> {
  double _fontSize = 18;
  Color appBarColor = Colors.orange[400];
  final _kPages = <Widget>[
    Container(
      child: Image.asset('assets/images/hiragana.jpg', fit: BoxFit.fill),
    ),
    Container(
      child: Image.asset('assets/images/katakana.jpg', fit: BoxFit.fill),
    ),
  ];

  final _kTabs = <Tab>[
    Tab(text: 'Хірагана',),
    Tab(text: 'Катакана',),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
       child: Scaffold(
         appBar: AppBar(
           title: Text('Абетка'),
           backgroundColor: appBarColor,
           bottom: TabBar(
             labelStyle: TextStyle(fontSize: _fontSize),
             tabs: _kTabs,
           ),
         ),
         body: TabBarView(
           children: _kPages,
         ),
       ),
    );
  }
}