class User {
  int _id;
  String _name;
  String _email;
  String _password;

  User(this._name, this._email, this._password);
  User.withId(this._id, this._name, this._email, this._password);

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;

  set name(String newName){
    this._name = newName;
  }

  set email(String newEmail){
   this._email = newEmail;
  }

  set password(String newPasswrod){
    _password = newPasswrod;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["name"] = _name;
    map["email"] = _email;
    map["password"] = _password;

    if(_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  User.fromObject(dynamic o){
    this._id = o["id"];
    this._name = o["name"];
    this._email = o["email"];
    this._password = o["password"];
  }
}