
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal{

  static final SPGlobal _instance = SPGlobal._mandarina();

  SPGlobal._mandarina();

  factory SPGlobal(){
    return _instance;
  }

  late SharedPreferences _prefs;

  Future initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set token(String value){
    _prefs.setString("token", value);
  }

  String get token{
    return _prefs.getString("token") ?? "";
  }

}