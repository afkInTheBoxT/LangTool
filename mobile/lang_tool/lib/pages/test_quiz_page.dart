import 'package:flutter/material.dart';
import 'package:lang_tool/models/Question.dart';

class ProgressBar extends StatelessWidget {

  final icons;
  final count;
  final total;

  ProgressBar({Key key, 
  this.icons, 
  this.count, 
  this.total
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$count -  $total',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 10,),
          ...icons,
        ],
      ),
    );
  }
}

class Quiz extends StatelessWidget {
    final index;
    final questionData;
    final onChangeAnswer;

  Quiz({Key key, this.index, this.questionData, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          questionData.questions[index].title,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      ...questionData.questions[index].answers
          .map((e) => Answer(
                title: e['answer'],
                onChangeAnswer: onChangeAnswer,
                isCorrect: e.containsKey('isCorrect') ? true : false,
              ))
          .toList(),
    ]);
  }
}
class Answer extends StatelessWidget {
  final String title;
  final isCorrect;
  final Function onChangeAnswer;

  Answer({Key key, this.title, this.isCorrect, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 5.0,
        ),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ]),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {

  final int count;
  final int total;
  final Function onClearState;

  Result({Key key, this.count, this.total, this.onClearState}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String msg = '';
    Icon img;
    
    if(0 <= count && count <= 1){
      msg = 'Ты ответил на $count вопроса(ов)';
      img = Icon(Icons.brightness_3);
    } else if(2 <= count && count <= 3 ){
      msg = 'Ты ответил на $count вопроса(ов)';
      img = Icon(Icons.brightness_4);
    } else {
      msg = 'Ты ответил на $count вопроса(ов)';
      img = Icon(Icons.brightness_7);
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset(2, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff5337ff),
            Color(0xff8131ff),
            Color(0xffbd27ff),
          ], 
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: FittedBox(
              // fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Верно ответил на $count из $total'
          ),
          Divider(
            color: Colors.white,
          ),
          FlatButton(
            child: Text(
              'Пройти еще раз',
            ),
            onPressed: onClearState,
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState((){
    _questionIndex = 0;
    _countResult = 0;
    _icons = [];
  });

  void _onChangeAnswer(bool isCorrect) => setState((){
    if (isCorrect){
      _icons.add(Icon(Icons.brightness_1, color: Color(0xffbd27ff)));
      _countResult++;
    } else {
      _icons.add(Icon(Icons.brightness_1, color: Color(0xff000000)));
    }

    _questionIndex++;
  });

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Тестирование')),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: const Color(0xff2a375a),
          image: DecorationImage(
            image: AssetImage('assets/images/2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            ProgressBar(
              icons: _icons,
              count: _questionIndex,
              total: data.questions.length,
            ),

            _questionIndex < data.questions.length 
            ? Quiz(
              index: _questionIndex,
              questionData: data,
              onChangeAnswer: _onChangeAnswer,
            )
            : Result(
              count: _countResult,
              total: data.questions.length,
              onClearState: _clearState,
            ),
          ],
        ),
      ),
    );
  }
}