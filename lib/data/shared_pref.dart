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
  static const _favorites = "favorites";
  static const String _lightThemeKey = 'is_theme_light';

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences!.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences!.getBool(_lightThemeKey) ?? true;
  //Save Hymn
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
  static List<String> getLocalHymn() =>
      _sharedPreferences?.getStringList(_userHymns) ?? [];

  ///Favorites
  static Future<void>? addToFavorites(String favorite) {
    List<String>? favorites = _sharedPreferences?.getStringList(_favorites);
    if (favorites?.contains(favorite) ?? false) {
      return _sharedPreferences!.setStringList(
          _favorites, [...favorites!..removeWhere((e) => e == favorite)]);
    } else {
      print("Saved");
      return _sharedPreferences!.setStringList(
          _favorites, [if (favorites != null) ...favorites, favorite]);
    }
  }

  //getting bookmarks
  static List<String> getFavorites() =>
      _sharedPreferences?.getStringList(_favorites) ?? [];
}
