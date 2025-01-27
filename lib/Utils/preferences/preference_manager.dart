
import 'package:apna_wash/Utils/preferences/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final AppPreference _appPreference = AppPreference._internal();

  factory AppPreference() {
    return _appPreference;
  }

  AppPreference._internal();

  late SharedPreferences _preferences;

  Future<void> initialAppPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  int getInt(String key, {int defValue = 0}) {
    return _preferences.getInt(key) != null ? (_preferences.getInt(key) ?? 0) : defValue;
  }

  Future setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String getString(String key, {String defValue = ''}) {
    return _preferences.getString(key) != null ? (_preferences.getString(key) ?? '') : defValue;
  }

  Future setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  bool getBool(String key, {bool defValue = false}) {
    return _preferences.getBool(key) ?? defValue;
  }

  Future setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  List<String> getStringList(String key, {List<String> defValue = const []}) {
    return _preferences.getStringList(key) ?? defValue;
  }

  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  Future<void> clearSharedPreferences() async {
    String email = getPastLoggedInEmail();
    String pass = getPastLoggedInPassword();

    await _preferences.clear();
    setPastLoggedInEmail(email);
    setPastLoggedInPassword(pass);
  }

  Future<void> removeData(String key) async {
    await _preferences.remove(key);
  }

  Future setPastLoggedInEmail(String value) async {
    await _preferences.setString(PreferencesKey.pastLoggedInEmail, value);
  }

  Future setPastLoggedInPassword(String value) async {
    await _preferences.setString(PreferencesKey.pastLoggedInPassword, value);
  }

  String getPastLoggedInEmail() {
    return getString(PreferencesKey.pastLoggedInEmail);
  }

  String getPastLoggedInPassword() {
    return getString(PreferencesKey.pastLoggedInPassword);
  }

// MyProfileModel? getUserData() {
//   if (AppPreference().containsKey(PreferencesKey.userProfileModel)) {
//     return MyProfileModel.fromJson(jsonDecode(AppPreference().getString(PreferencesKey.userProfileModel)));
//   }
//   return null;
// }

// PlayerModel? getCurrentPlayer() {
//   if (AppPreference().containsKey(PreferencesKey.currentPlayer)) {
//     log("Get current Player :--> ${AppPreference().getString(PreferencesKey.currentPlayer)}");
//     return PlayerModel.fromJson(jsonDecode(AppPreference().getString(PreferencesKey.currentPlayer)));
//   }
//   return null;
// }
}
