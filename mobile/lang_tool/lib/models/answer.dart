import 'dart:ffi';

class Answer{
  int answerId;
  String correctAnswer;
  double mark;

  Answer(this.correctAnswer, this.mark);
  Answer.withId(this.answerId, this.correctAnswer, this.mark);
  Answer._({this.answerId, this.correctAnswer, this.mark});

  int get id => answerId;
  String get correct => correctAnswer;
  double get markAnswer => mark;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["correctAnswer"] = correctAnswer;
    map["mark"] = mark;

    if(answerId != null) {
      map["answer_id"] = answerId;
    }

    return map;
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return new Answer._(
      answerId: json['answer_id'],
      correctAnswer: json['correctAnswer'],
      mark: json['mark'],
    );
  }

  Answer.fromObject(dynamic o){
    this.answerId = o["answer_id"];
    this.correctAnswer = o["correctAnswer"];
    this.mark = o["mark"];
  }
}