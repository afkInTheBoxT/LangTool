import 'dart:ffi';

class Question{
  int questionId;
  String questionName;
  double multiplyer;

  Question(this.questionName, this.multiplyer);
  Question.withId(this.questionId, this.questionName, this.multiplyer);
  Question._({this.questionId, this.questionName, this.multiplyer});

  int get idQuestion => questionId;
  String get nameQuestion => questionName;
  double get multiplyerQuestion => multiplyer;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["questionName"] = questionName;
    map["multiplyer"] = multiplyer;

    if(questionId != null) {
      map["question_id"] = questionId;
    }

    return map;
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return new Question._(
      questionId: json['question_id'],
      questionName: json['questionName'],
      multiplyer: json['multiplyer'],
    );
  }

  Question.fromObject(dynamic o){
    this.questionId = o["question_id"];
    this.questionName = o["questionName"];
    this.multiplyer = o["multiplyer"];
  }
}