import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/controller/login_controller.dart';
import 'Api/shred_preference.dart';
import '/project/home/home_page.dart';
import 'Cubit/Admin Level Operation/admin_level_cubit.dart';
import 'Cubit/Cubit Accountant -User/accountant_cubit.dart';
// import 'Cubit/CubitAccountant/accountant_cubit.dart';
import 'Cubit/User Level Operation/user_operation_cubit.dart';
import 'authentication/choose_auth_type.dart';
import 'project/projects_page.dart';
//import 'splash_screen.dart';

//String tokenUser  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';

//String tokenAdmin = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';


String userToken = '';
String adminToken = '';

Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  //adminToken = '';
  // userToken = '';
  //adminToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTZlNWE0YzA1Yzg2ZmQ4NDk0N2FiZTM1NDlkZjM3MWZiY2VkYmE5ODZmYmRiNTU1ZGZjMWY2YWU0MjM1MDk3MTlhZWMxYTFlYWYyYTUzNzkiLCJpYXQiOjE2NjI3NDQ5NjEuNTUwNzM5LCJuYmYiOjE2NjI3NDQ5NjEuNTUwNzU3LCJleHAiOjE2OTQyODA5NjEuNTMzNzMzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qJYCFwUnKcrJfzYphxRcFWw9fj-n8WwHkBPwOe_CHia47On0YhbGSrO4bjWGxa3EXGWZM5qqgzTo1xoIOKvr_7RnetD2M7kkykEEY9hqDbbUzTg29xYuAt-rX0pc3AxMjifQRZXy3_DMQ91pvA1476HrNseZxkF5t4XxzYx4W8aAp-tDFOrolXp29bcPGHvt15JBHw1rqx0luLZVBv1hMLxqZrz9P8rYn7I5qh-9CRhy-pVLCOtgmsBUcjHgJwKyHHaNbYDhhvtROuH3-_sP_vkWzumilDGQgZi28GqNZB2tkZhW7vCNH9NuSeUJf0Mo66ROWNhc0cKeEUo3S634fSgQ2NZxhuS7xM-Qiih7yJ3eRB6eXcGnGIIHjOTRU2WhRVSfM_QFGdFtnihscM8HOPAx64tbTAueFQ_wuu8lUU97GsC0loRPaEy8D1WmVZL7oFt3JV88Kac_uksQKOTINWAgO5qyzhFobYaDAocuiskJbVUgrYiTONQDNywnRBlC74MWjlQkR222_d-QGYQKpynWQnXc41Mz8KBbqi2uY2tSiEtlIhD2V7_SxSUPjwq9zOOT2-_-xLf70Vswm6Yd3TFm2RraaZ0wNxsr7CBc5mBAejRiT3nXAl0Iqr7NNYSHDdEAIpAcPFx2nh7UxicCMqy1dindeb1kHlN1SO4xgEI';
//   userToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTZlNWE0YzA1Yzg2ZmQ4NDk0N2FiZTM1NDlkZjM3MWZiY2VkYmE5ODZmYmRiNTU1ZGZjMWY2YWU0MjM1MDk3MTlhZWMxYTFlYWYyYTUzNzkiLCJpYXQiOjE2NjI3NDQ5NjEuNTUwNzM5LCJuYmYiOjE2NjI3NDQ5NjEuNTUwNzU3LCJleHAiOjE2OTQyODA5NjEuNTMzNzMzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qJYCFwUnKcrJfzYphxRcFWw9fj-n8WwHkBPwOe_CHia47On0YhbGSrO4bjWGxa3EXGWZM5qqgzTo1xoIOKvr_7RnetD2M7kkykEEY9hqDbbUzTg29xYuAt-rX0pc3AxMjifQRZXy3_DMQ91pvA1476HrNseZxkF5t4XxzYx4W8aAp-tDFOrolXp29bcPGHvt15JBHw1rqx0luLZVBv1hMLxqZrz9P8rYn7I5qh-9CRhy-pVLCOtgmsBUcjHgJwKyHHaNbYDhhvtROuH3-_sP_vkWzumilDGQgZi28GqNZB2tkZhW7vCNH9NuSeUJf0Mo66ROWNhc0cKeEUo3S634fSgQ2NZxhuS7xM-Qiih7yJ3eRB6eXcGnGIIHjOTRU2WhRVSfM_QFGdFtnihscM8HOPAx64tbTAueFQ_wuu8lUU97GsC0loRPaEy8D1WmVZL7oFt3JV88Kac_uksQKOTINWAgO5qyzhFobYaDAocuiskJbVUgrYiTONQDNywnRBlC74MWjlQkR222_d-QGYQKpynWQnXc41Mz8KBbqi2uY2tSiEtlIhD2V7_SxSUPjwq9zOOT2-_-xLf70Vswm6Yd3TFm2RraaZ0wNxsr7CBc5mBAejRiT3nXAl0Iqr7NNYSHDdEAIpAcPFx2nh7UxicCMqy1dindeb1kHlN1SO4xgEI';


  // userToken = '';

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) =>
                AccountantCubit()
                  ..checkToken()

            ),

            BlocProvider(
                create: (BuildContext context) =>
                    UserOperationCubit()


            ),

            BlocProvider(
                create: (BuildContext context) =>
                    AdminLevelCubit()


            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Barton Malow",
            home: MyHomePage(),
          ));

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountantCubit, UserAccountantState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=AccountantCubit.get(context);
        cubit.checkToken();
        return _MyHomePage();
      },
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  String _authenticated = '';

  Future<String> checkAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenUser = prefs.getString('tokenUser');
    String? tokenAdmin = prefs.getString('tokenAdmin');

    if(tokenUser !='')
    {
      userToken=tokenUser!;
      print("log in user ");
      return userToken;
    }
    else  if(tokenAdmin !='')
    {
      adminToken=tokenAdmin!;
      return adminToken;
    }
    return '';
  }

  @override
  void initState() {
    // TODO: implement initState
    checkAuthenticated().then((value)
    {

      setState(() {
        checkAuthenticated();
      });
    }

    );
    super.initState();

  }

  @override
  // Widget build(BuildContext context) => const DeleteService();
/*
 Widget build(BuildContext context) =>  ProjectsPage(false);

 */

  Widget build(BuildContext context) =>
      (userToken == '' && adminToken == '')
          ? AuthChoosingPage()
          : (adminToken == '' ? ProjectsPage(false)
          : ProjectsPage(true));


/*
  Widget build(BuildContext cwontext) => ProjectsPage();

   */
}



















/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Admin Level Operation/admin_level_cubit.dart';
import 'Cubit/Cubit Accountant -User/accountant_cubit.dart';
import 'Cubit/User Level Operation/user_operation_cubit.dart';
import 'authentication/choose_auth_type.dart';
import 'project/projects_page.dart';

//String tokenUser  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';

//String tokenAdmin = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';

String userToken = '';
String adminToken = '';

Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
  //adminToken = '';
  // userToken = '';
  //adminToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTZlNWE0YzA1Yzg2ZmQ4NDk0N2FiZTM1NDlkZjM3MWZiY2VkYmE5ODZmYmRiNTU1ZGZjMWY2YWU0MjM1MDk3MTlhZWMxYTFlYWYyYTUzNzkiLCJpYXQiOjE2NjI3NDQ5NjEuNTUwNzM5LCJuYmYiOjE2NjI3NDQ5NjEuNTUwNzU3LCJleHAiOjE2OTQyODA5NjEuNTMzNzMzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qJYCFwUnKcrJfzYphxRcFWw9fj-n8WwHkBPwOe_CHia47On0YhbGSrO4bjWGxa3EXGWZM5qqgzTo1xoIOKvr_7RnetD2M7kkykEEY9hqDbbUzTg29xYuAt-rX0pc3AxMjifQRZXy3_DMQ91pvA1476HrNseZxkF5t4XxzYx4W8aAp-tDFOrolXp29bcPGHvt15JBHw1rqx0luLZVBv1hMLxqZrz9P8rYn7I5qh-9CRhy-pVLCOtgmsBUcjHgJwKyHHaNbYDhhvtROuH3-_sP_vkWzumilDGQgZi28GqNZB2tkZhW7vCNH9NuSeUJf0Mo66ROWNhc0cKeEUo3S634fSgQ2NZxhuS7xM-Qiih7yJ3eRB6eXcGnGIIHjOTRU2WhRVSfM_QFGdFtnihscM8HOPAx64tbTAueFQ_wuu8lUU97GsC0loRPaEy8D1WmVZL7oFt3JV88Kac_uksQKOTINWAgO5qyzhFobYaDAocuiskJbVUgrYiTONQDNywnRBlC74MWjlQkR222_d-QGYQKpynWQnXc41Mz8KBbqi2uY2tSiEtlIhD2V7_SxSUPjwq9zOOT2-_-xLf70Vswm6Yd3TFm2RraaZ0wNxsr7CBc5mBAejRiT3nXAl0Iqr7NNYSHDdEAIpAcPFx2nh7UxicCMqy1dindeb1kHlN1SO4xgEI';
//   userToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTZlNWE0YzA1Yzg2ZmQ4NDk0N2FiZTM1NDlkZjM3MWZiY2VkYmE5ODZmYmRiNTU1ZGZjMWY2YWU0MjM1MDk3MTlhZWMxYTFlYWYyYTUzNzkiLCJpYXQiOjE2NjI3NDQ5NjEuNTUwNzM5LCJuYmYiOjE2NjI3NDQ5NjEuNTUwNzU3LCJleHAiOjE2OTQyODA5NjEuNTMzNzMzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qJYCFwUnKcrJfzYphxRcFWw9fj-n8WwHkBPwOe_CHia47On0YhbGSrO4bjWGxa3EXGWZM5qqgzTo1xoIOKvr_7RnetD2M7kkykEEY9hqDbbUzTg29xYuAt-rX0pc3AxMjifQRZXy3_DMQ91pvA1476HrNseZxkF5t4XxzYx4W8aAp-tDFOrolXp29bcPGHvt15JBHw1rqx0luLZVBv1hMLxqZrz9P8rYn7I5qh-9CRhy-pVLCOtgmsBUcjHgJwKyHHaNbYDhhvtROuH3-_sP_vkWzumilDGQgZi28GqNZB2tkZhW7vCNH9NuSeUJf0Mo66ROWNhc0cKeEUo3S634fSgQ2NZxhuS7xM-Qiih7yJ3eRB6eXcGnGIIHjOTRU2WhRVSfM_QFGdFtnihscM8HOPAx64tbTAueFQ_wuu8lUU97GsC0loRPaEy8D1WmVZL7oFt3JV88Kac_uksQKOTINWAgO5qyzhFobYaDAocuiskJbVUgrYiTONQDNywnRBlC74MWjlQkR222_d-QGYQKpynWQnXc41Mz8KBbqi2uY2tSiEtlIhD2V7_SxSUPjwq9zOOT2-_-xLf70Vswm6Yd3TFm2RraaZ0wNxsr7CBc5mBAejRiT3nXAl0Iqr7NNYSHDdEAIpAcPFx2nh7UxicCMqy1dindeb1kHlN1SO4xgEI';

  adminToken = '';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) =>
                AccountantCubit()..checkToken()),
            BlocProvider(
                create: (BuildContext context) => UserOperationCubit()),
            BlocProvider(create: (BuildContext context) => AdminLevelCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Barton Malow",
            home: MyHomePage(),
          ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountantCubit, UserAccountantState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AccountantCubit.get(context);
        cubit.checkToken();
        return _MyHomePage();
      },
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // Widget build(BuildContext context) => const DeleteService();
/*
 Widget build(BuildContext context) =>  ProjectsPage(false);

 */
  Widget build(BuildContext context) => (userToken == '' && adminToken == '')
      ? AuthChoosingPage()
      : (adminToken == ''
          ? ProjectsPage(
              false,
            )
          : ProjectsPage(
              true,
            )
  );

/*
  Widget build(BuildContext context) => ProjectsPage();

   */
}

 */