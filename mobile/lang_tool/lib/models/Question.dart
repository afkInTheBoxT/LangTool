import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({
    @required this.title, 
    @required this.answers,
    });
}

class QuestionData {
  final _data = [
    Question(
      title: 'Кем хочешь стать?', 
      answers: [
          {'answer' : '1', 'isCorrect' : true},
          {'answer' : '2',},
          {'answer' : '3',},
          {'answer' : '4',},
        ]
      ),
    Question(title: 'Вопрос 2', 
    answers: [
        {'answer' : '1',},
        {'answer' : '2', 'isCorrect' : true},
        {'answer' : '3',},
        {'answer' : '4',},
      ]
    ),
    Question(title: 'Вопрос 3', 
    answers: [
        {'answer' : '1',},
        {'answer' : '2',},
        {'answer' : '3', 'isCorrect' : true},
        {'answer' : '4',},
      ]
    ),
    Question(title: 'Вопрос 4', 
    answers: [
        {'answer' : '1',},
        {'answer' : '2',},
        {'answer' : '3',},
        {'answer' : '4', 'isCorrect' : true},
      ]
    ),
  ];

  List<Question> get questions {
    return [..._data];
  }
}