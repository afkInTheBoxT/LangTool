class Deadline {
  int deadlineId;
  String topic;
  String dateStart;
  String dateEnd;
  bool finished;

  Deadline(this.topic, this.dateStart, this.dateEnd, this.finished);
  Deadline.withId(this.deadlineId, this.topic, this.dateStart, this.dateEnd, this.finished);
  Deadline._({this.deadlineId, this.topic, this.dateStart, this.dateEnd, this.finished});

  int get deadLineId => deadlineId;
  String get topicDed => topic;
  String get dateStartDed => dateStart;
  String get dateEndDed => dateEnd;
  bool get finishedDed => finished;

  set topicDed(String topic){
    this.topic = topic;
  }

  set dateStartDed(String dateStart){
   this.dateStart = dateStart;
  }

  set dateEndDed(String dateEnd){
    this.dateEnd = dateEnd;
  }

  set finishedDed(bool finished){
    this.finished = finished;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["Topic"] = topic;
    map["DateStart"] = dateStart;
    map["DateEnd"] = dateEnd;
    map["Finished"] = finished;

    if(deadlineId != null) {
      map["Deadline_id"] = deadlineId;
    }

    return map;
  }

  factory Deadline.fromJson(Map<String, dynamic> json) {
    return new Deadline._(
      deadlineId: json['Deadline_id'],
      topic: json['Topic'],
      dateStart: json['DateStart'],
      dateEnd: json['DateEnd'],
      finished: json['Finished'],
    );
  }

  Deadline.fromObject(dynamic o){
    this.deadlineId = o["deadline_id"];
    this.topic = o["topic"];
    this.dateStart = o["dateStart"];
    this.dateEnd = o["dateEnd"];
    this.finished = o["finished"];
  }
}