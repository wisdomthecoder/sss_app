import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sss_app/model/hymn.dart';

// SharedPreference
class AppStorage {
  AppStorage._();
  // shared pref init
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///[KEYS]
  static const _userHymns = "userHymns";

  static Future<void>? saveNewHymn(String hymn) {
    List<String>? hymns = _sharedPreferences?.getStringList(_userHymns);
    if (hymns?.contains(hymn) ?? false) {
      Get.snackbar("Error!", "Already added to Hymn");
    } else {
      print("Saved");
      return _sharedPreferences!
          .setStringList(_userHymns, [if (hymns != null) ...hymns, hymn]);
    }
  }

  //getting bookmarks
  static List<String> getBookmarks() =>
      _sharedPreferences?.getStringList(_userHymns) ?? [];
}
