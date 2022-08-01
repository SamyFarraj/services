




import 'package:shared_preferences/shared_preferences.dart';

import '../moh_project/post_moh/login_controller.dart';


 saveshared(String mytoken)async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('Token', "$mytoken");
}

 getshared()async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  String? mytoken;

  mytoken=pref.getString('Token') ?? "M";
  t= mytoken;

}

delettoken()async
{
  SharedPreferences pref= await SharedPreferences.getInstance();
  pref.setString('Token', '');

}