import 'dart:ffi';

class Test{
  int testId;
  String testName;
  double totalMark;

  Test(this.testName, this.totalMark);
  Test.withId(this.testId, this.testName, this.totalMark);
  Test._({this.testId, this.testName, this.totalMark});

  int get idTest => testId;
  String get nameTest => testName;
  double get totalMarkTest => totalMark;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["testName"] = testName;
    map["totalMark"] = totalMark;

    if(testId != null) {
      map["test_id"] = testId;
    }

    return map;
  }

  factory Test.fromJson(Map<String, dynamic> json) {
    return new Test._(
      testId: json['test_id'],
      testName: json['testName'],
      totalMark: json['totalMark'],
    );
  }

  Test.fromObject(dynamic o){
    this.testId = o["test_id"];
    this.testName = o["testName"];
    this.totalMark = o["totalMark"];
  }
}