import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  static ShareHelper helper = ShareHelper._();
  ShareHelper._();
  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", isTheme);
  }

  Future<bool?> applyTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.getBool("theme");
    return shr.getBool("theme");
  }
}
