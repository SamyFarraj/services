import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< HEAD
import '../main.dart';
import '../moh_project/post_moh/login_controller.dart';


 savesharedAdmin(String tokenAdmin)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('tokenAdmin', "$tokenAdmin");
=======
saveShared(String theToken) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    'Token',
    "$theToken",
  );
>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d
}
saveSharedUser(String tokenUser)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('tokenUser', "$tokenUser");
}


<<<<<<< HEAD
 getshared()async
{
  print("11111111111");
  SharedPreferences pref= await SharedPreferences.getInstance();
  print("333333333333");

  tokenUser=pref.getString('tokenUser')?? '';
  tokenAdmin=pref.getString('tokenAdmin')?? '';
  print("2222222222");
=======
getSharedData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? theToken;
>>>>>>> 7af0289f19b2ab59e21f79499360d49b316fc19d

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
