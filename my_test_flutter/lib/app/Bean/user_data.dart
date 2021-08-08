/// data : {"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[1165,101,10655,10459,10811,10721,9988,12384,13627,15188,16441,16455,16194,16517,16697,17915],"email":"","icon":"","id":7780,"nickname":"wo5813288","password":"","publicName":"wo5813288","token":"","type":0,"username":"wo5813288"}
/// errorCode : 0
/// errorMsg : ""

class UserData {
 late User _data;
 late int _errorCode;
 late String _errorMsg;

  User get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  UserData({
    required User data,
      required int errorCode,
      required String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  UserData.fromJson(dynamic json) {
    _data = (json["data"] != null ? User.fromJson(json["data"]) : null)!;
    _errorCode = json["errorCode"];
    _errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["errorCode"] = _errorCode;
    map["errorMsg"] = _errorMsg;
    return map;
  }

}

/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : [1165,101,10655,10459,10811,10721,9988,12384,13627,15188,16441,16455,16194,16517,16697,17915]
/// email : ""
/// icon : ""
/// id : 7780
/// nickname : "wo5813288"
/// password : ""
/// publicName : "wo5813288"
/// token : ""
/// type : 0
/// username : "wo5813288"

class User {
  late bool _admin;
  late int _coinCount;
  late List<int> _collectIds;
  late String _email;
  late String _icon;
  late int _id;
  late String _nickname;
  late String _password;
  late String _publicName;
  late String _token;
  late int _type;
  late String _username;

  bool get admin => _admin;
  int get coinCount => _coinCount;
  List<int> get collectIds => _collectIds;
  String get email => _email;
  String get icon => _icon;
  int get id => _id;
  String get nickname => _nickname;
  String get password => _password;
  String get publicName => _publicName;
  String get token => _token;
  int get type => _type;
  String get username => _username;

  User({
      required bool admin,
      required List<dynamic> chapterTops,
      required int coinCount,
      required List<int> collectIds,
      required String email,
      required String icon,
      required int id,
      required String nickname,
      required String password,
      required String publicName,
      required String token,
      required int type,
      required String username}){
    _admin = admin;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
}

  User.fromJson(dynamic json) {
    _admin = json["admin"];
    _coinCount = json["coinCount"];
    _collectIds = json["collectIds"] != null ? json["collectIds"].cast<int>() : [];
    _email = json["email"];
    _icon = json["icon"];
    _id = json["id"];
    _nickname = json["nickname"];
    _password = json["password"];
    _publicName = json["publicName"];
    _token = json["token"];
    _type = json["type"];
    _username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["admin"] = _admin;
    map["coinCount"] = _coinCount;
    map["collectIds"] = _collectIds;
    map["email"] = _email;
    map["icon"] = _icon;
    map["id"] = _id;
    map["nickname"] = _nickname;
    map["password"] = _password;
    map["publicName"] = _publicName;
    map["token"] = _token;
    map["type"] = _type;
    map["username"] = _username;
    return map;
  }

  void setUserPassword(String password){
    _password = password;
  }
}




