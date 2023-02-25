import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String getName() {
    String name = '';
    _prefs.then((SharedPreferences prefs) {
      name = prefs.getString('name') ?? '';
    });
    return name;
  }

  void setName(String name) {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('name', name);
    });
  }
}
