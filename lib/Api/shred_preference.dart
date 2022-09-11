import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


 saveSharedAdmin(String tokenAdmin)async
 {
   SharedPreferences pref = await SharedPreferences.getInstance();
   pref.setString('tokenAdmin', "$tokenAdmin");
 }
saveShared(String theToken) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    'Token',
    "$theToken",
  );
}
saveSharedUser(String tokenUser)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('tokenUser', "$tokenUser");
  print(" tokeeeeeeeeeeeeeeeen \n  asds ${pref.getString('tokenUser')}");
}
  getSharedDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? theToken;
    theToken = pref.getString('tokenUser') ?? "";
    print("Userfsfdds ${theToken}");

    userToken = theToken;

  }
getSharedDataAdmin() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? theToken;
  theToken = pref.getString('tokenAdmin') ?? "";
  print("admin");
  adminToken = theToken;
  return adminToken;

}

deleteToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    'tokenUser', '');
  pref.setString(
      'tokenAdmin', '');
}
/*
 getshared()async
 {
   print("11111111111");
   SharedPreferences pref = await SharedPreferences.getInstance();
   print("333333333333");

   tokenUser = pref.getString('tokenUser') ?? '';
   tokenAdmin = pref.getString('tokenAdmin') ?? '';
   print("2222222222");
 }

 */