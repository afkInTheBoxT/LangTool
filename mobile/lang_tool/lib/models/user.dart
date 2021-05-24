class User {
  int id;
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);
  User.withId(this.id, this.name, this.email, this.password);
  User._({this.id, this.name, this.email, this.password});

  int get idUser => id;
  String get nameUser => name;
  String get emailUser => email;
  String get passwordUser => password;

  set nameUser(String newName){
    this.name = newName;
  }

  set emailUser(String newEmail){
   this.email = newEmail;
  }

  set passwordUser(String newPasswrod){
    password = newPasswrod;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["name"] = name;
    map["email"] = email;
    map["password"] = password;

    if(id != null) {
      map["user_id"] = id;
    }

    return map;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return new User._(
      id: json['user_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  User.fromObject(dynamic o){
    this.id = o["user_id"];
    this.name = o["name"];
    this.email = o["email"];
    this.password = o["password"];
  }
}