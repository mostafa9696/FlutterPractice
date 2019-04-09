
class User{
  String _userName;
  String _password;
  String _id;

  String get id => _id;
  String get password => _password;
  String get userName => _userName;

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

}