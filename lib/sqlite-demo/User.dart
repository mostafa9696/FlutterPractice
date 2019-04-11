
class User{
  String _userName;
  String _password;
  int _id;

  int get id => _id;
  String get password => _password;
  String get userName => _userName;


  set userName(String value) {
    _userName = value;
  }

  User(this._userName, this._password);

  User.map(dynamic obj){    // dynamic value can be of any type
    this._userName = obj['username'];
    this._password = obj['password'];
    this._id = obj['id'];
  }

  User.fromMap(Map<String, dynamic> map){
    this._userName = map['username'];
    this._password = map['password'];
    this._id = map['id'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["username"] = this._userName;
    map["password"] = this._password;
    if(id != null) {
      map["id"] = this._id;
    }
    return map;
  }

  set password(String value) {
    _password = value;
  }

  set id(int value) {
    _id = value;
  }

}