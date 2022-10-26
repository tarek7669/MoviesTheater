import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  // static late SharedPreferences prefs;
  // static final prefs = null;

  // static init()async{
  //
  //   SharedPreferences prefs= await SharedPreferences.getInstance();
  //
  //   // prefs.setString(key, value)
  // }

  static late SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setToken(String pref, value)async {

    // SharedPreferences prefs= await SharedPreferences.getInstance();

    sharedPreferences.setString(pref, value);
  }

  static Future<String?> getToken(String pref)async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = sharedPreferences.getString('token');
    return sharedPreferences.getString('token');
  }

  static Future<bool> check() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey('token'))
      return true;
    return false;

  }

}