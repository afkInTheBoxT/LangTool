class Result{
  double totalMark;
  double currentMark;
  int correctUserAnswers;

  Result(this.totalMark, this.currentMark, this.correctUserAnswers);
  Result._({this.totalMark, this.currentMark, this.correctUserAnswers});

  double get totalmark => totalMark;
  double get currentmark => currentMark;
  int get correctuserAnswers => correctUserAnswers;

  set totalmark(double totalMark){
    this.totalMark = totalMark;
  }

  set currentmark(double currentMark){
   this.currentMark = currentMark;
  }

  set correctuserAnswers(int correctUserAnswers){
    this.correctUserAnswers = correctUserAnswers;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["totalMark"] = totalMark;
    map["currentMark"] = currentMark;
    map["correctUserAnswers"] = correctUserAnswers;

    return map;
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return new Result._(
      totalMark: json['totalMark'],
      currentMark: json['currentMark'],
      correctUserAnswers: json['correctUserAnswers'],
    );
  }

  Result.fromObject(dynamic o){
    this.totalMark = o["totalMark"];
    this.currentMark = o["currentMark"];
    this.correctUserAnswers = o["correctUserAnswers"];
  }
}