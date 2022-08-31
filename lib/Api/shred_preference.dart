import 'package:shared_preferences/shared_preferences.dart';

saveShared(String theToken) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    'Token',
    "$theToken",
  );
}

getSharedData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? theToken;

  theToken = pref.getString('Token') ?? "M";
  theToken = theToken;
}

deleteToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    'Token',
    '',
  );
}
