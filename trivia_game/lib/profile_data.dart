import 'package:trivia_game/api/preferences.dart';

class ProfileData {
  String name = "";

  ProfileData({
    this.name = "",
  });

  void setName(String inputname) {
    name = inputname;
    Preferences().setName(name);
  }

  void setNameFromPreferences(String prefname) {
    print("Setting name from preferences: $prefname");
    name = prefname;
  }

  String getName() {
    print("Getting name: $name");
    return name;
  }
}
