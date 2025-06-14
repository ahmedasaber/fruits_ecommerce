import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static late SharedPreferences _instance;

  static Future<void> init() async{
    _instance = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) async{
    await _instance.setBool(key, value);
  }

  static bool getBool(String key){
    return _instance.getBool(key) ?? false;
  }
}