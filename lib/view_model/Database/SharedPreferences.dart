import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static late SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setToken(String pref, value)async {
    sharedPreferences.setString(pref, value);
  }

  static Future<String?> getToken(String pref)async{
    return sharedPreferences.getString('token');
  }

  static Future<bool> check() async {
    if(sharedPreferences.containsKey('token'))
      return true;
    return false;

  }

  static Future<bool> deleteAll() async{
    return await sharedPreferences.clear();
  }

}