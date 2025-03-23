import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static Future<SharedPreferences> getInstance() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs;
  }

  static Future<bool?> getIsLightTheme() async{
    SharedPreferences preferences = await getInstance();
    if(preferences.getBool('isLightTheme') == null){
      throw Exception('No theme define');
    }
    return preferences.getBool('isLightTheme');
  }
}