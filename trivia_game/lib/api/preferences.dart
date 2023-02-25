import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getName() async {
    String name = '';
    final SharedPreferences prefs = await _prefs;
    name = prefs.getString('name')!;
    print("Getting name from preferences: $name");

    return name;
  }

  void setName(String name) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('name', name);
  }

  void clearName() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('name');
  }
}
