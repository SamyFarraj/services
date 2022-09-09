




import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../moh_project/post_moh/login_controller.dart';


 savesharedAdmin(String tokenAdmin)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('tokenAdmin', "$tokenAdmin");
}
saveSharedUser(String tokenUser)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('tokenUser', "$tokenUser");
}


 getshared()async
{
  print("11111111111");
  SharedPreferences pref= await SharedPreferences.getInstance();
  print("333333333333");

  tokenUser=pref.getString('tokenUser')?? '';
  tokenAdmin=pref.getString('tokenAdmin')?? '';
  print("2222222222");

}

delettoken()async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('Token', '');

}