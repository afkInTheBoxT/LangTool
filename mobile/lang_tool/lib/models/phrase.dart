class Phrase {
  int phraseId;
  String topicName;
  String phraseName;
  String japanesePhraseName;
  String translatePhraseName;

  Phrase(this.topicName, this.phraseName, this.japanesePhraseName, this.translatePhraseName);
  Phrase.withId(this.phraseId, this.topicName, this.phraseName, this.japanesePhraseName, this.translatePhraseName);
  Phrase._({this.phraseId, this.topicName, this.phraseName, this.japanesePhraseName, this.translatePhraseName});

  int get phraseIdPh => phraseId;
  String get topicNamePh => topicName;
  String get phraseNamePh => phraseName;
  String get japanesePhraseNamePh => japanesePhraseName;
  String get translatePhraseNamePh => translatePhraseName;

  set topicNamePh(String topicName){
    this.topicName = topicName;
  }

  set phraseNamePh(String phraseName){
   this.phraseName = phraseName;
  }

  set japanesePhraseNamePh(String japanesePhraseName){
    this.japanesePhraseName = japanesePhraseName;
  }

  set translatePhraseNamePh(String translatePhraseName){
    this.translatePhraseName = translatePhraseName;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["topicName"] = topicName;
    map["phraseName"] = phraseName;
    map["japanesePhraseName"] = japanesePhraseName;
    map["translatePhraseName"] = translatePhraseName;

    if(phraseId != null) {
      map["phrase_id"] = phraseId;
    }

    return map;
  }

  factory Phrase.fromJson(Map<String, dynamic> json) {
    return new Phrase._(
      phraseId: json['phrase_id'],
      topicName: json['topicName'],
      phraseName: json['phraseName'],
      japanesePhraseName: json['japanesePhraseName'],
      translatePhraseName: json['translatePhraseName'],
    );
  }

  Phrase.fromObject(dynamic o){
    this.phraseId = o["phrase_id"];
    this.topicName = o["topicName"];
    this.phraseName = o["phraseName"];
    this.japanesePhraseName = o["japanesePhraseName"];
    this.translatePhraseName = o["translatePhraseName"];
  }
}