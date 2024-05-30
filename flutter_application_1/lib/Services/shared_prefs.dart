import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  late SharedPreferences _prefs;

  static final UserPrefs _instance = UserPrefs._internal();

  factory UserPrefs() {
    return _instance;
  }

  UserPrefs._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // datos del user
  String get password => _prefs.getString('password') ?? "";
  set password(String value) => _prefs.setString('password', value);

  String get email => _prefs.getString('email') ?? "";
  set email(String value) => _prefs.setString('email', value);

  String get username => _prefs.getString('username') ?? "";
  set username(String value) => _prefs.setString('username', value);

  // metodos para listas de booleanos
  List<bool> getFoodPreferences() {
    List<String>? prefsList = _prefs.getStringList('foodPreferences');
    if (prefsList == null) return List.generate(9, (index) => false);
    return prefsList.map((e) => e == 'true').toList();
  }

  setFoodPreferences(List<bool> values) {
    List<String> prefsList = values.map((e) => e.toString()).toList();
    _prefs.setStringList('foodPreferences', prefsList);
  }
}
