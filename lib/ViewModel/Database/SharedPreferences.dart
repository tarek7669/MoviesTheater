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

  void setToken(String pref, value)async {

    SharedPreferences prefs= await SharedPreferences.getInstance();

    prefs.setString(pref, value);
  }

  Future<String?> getToken(String pref)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  Future<bool> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('token')){
      return true;
    }else{
      return false;
    }
  }

}