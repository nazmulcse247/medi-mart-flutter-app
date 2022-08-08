import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static Future<bool> saveOnboard(String firstTime) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('onboard', firstTime);

  }

  static Future<String?> getOnboard() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('onboard');

  }

}