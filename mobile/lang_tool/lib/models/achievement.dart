class Achievements {
  int achievement_id;
  String name;
  String description;
  // String password;

  Achievements(this.name, this.description);
  Achievements.withId(this.achievement_id, this.name, this.description);
  Achievements._({this.achievement_id, this.name, this.description});

  int get idAchievementr => achievement_id;
  String get nameAchievement => name;
  String get descriptionAchievement => description;

  set nameAchievement(String newName){
    this.name = newName;
  }

  set descriptionAchievement(String newDescription){
   this.description = newDescription;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["name"] = name;
    map["description"] = description;

    if(achievement_id!= null) {
      map["achievement_id"] = achievement_id;
    }

    return map;
  }

  factory Achievements.fromJson(Map<String, dynamic> json) {
    return new Achievements._(
      achievement_id: json['achievement_id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Achievements.fromObject(dynamic o){
    this.achievement_id = o["achievement_id"];
    this.name = o["name"];
    this.description = o["description"];
  }
}