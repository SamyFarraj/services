import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Api/shredpreference.dart';
//String t='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWJiYWMwMGUxOTIyOTNkOGQxZTI5YzNjNmMwNjg2M2U4YmQxNzA1ZWExNDg4ODNkMzNmNGFkMzAxMzliOTBhYmFlYjNjYzkwZTc2NzRjYmYiLCJpYXQiOjE2NTY0MTc0MzUuOTIyNjY0LCJuYmYiOjE2NTY0MTc0MzUuOTIyNjY5LCJleHAiOjE2ODc5NTM0MzUuOTA4MTUsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.FrjSOCB57NDXdtymgdREkiPLvYKpcijjgm6O-Ux2GOEr-NkTFH_lw7izMVb7KGpJoDRO39ZUviE8lW--FRQZRWLEtMHLuBMqQFlG_X1HZY-CIMr6m6qHY1yqjfOiefsfRfHQKVrIvBiLj57JTPo_Tm38IBdaW5MXyFoTztFCW2n8cbU-6qfwz4EimN1IJ2NKvze1rAI9QbmKrLUdzACHkI8sBGSS6P86-Rxa_1qkHPXMe7NJ3UQLfimy2oyxD5T3AzxDcH4b2Cl_8e53nKD4jduxEw6j4mzWzdockiUZMloCLAT4q1QCt82oxGzDYq9kWHBAXrVD6H2d1-nB39PewuNOnmOxn-fFgIHWrcPpYtbXWQg_cxBi1lG5r4dm3MFgtEUF3JSDo6rRYXgXnsHYkbj3x9V6IvymbUBitHWoHZ8P2sKA6GsI0aFTD6_oOlyimeMqVntQ33U3HXIISImily0gOw_za3DlKn9JZlj-A8MPNzPso1t_VIl2KZq7kdsfvGhGu28rTKh9LQtqKIAsEigX1JUgboLzb8LEgKF7QFM9QDGFD7uCYsSeWeemJhVMZvMzuWg176qCMqv4GBOVzk2JlwXdJgSZqIJOofqMKVRebQ3RhSkVH1g5w5Tckyw3MEbRUD_8sRNiJYPhdJ5DZQUMnvrY1YVPvzg30UKUz_8';
String t='';
class logincontroller {
  var token;
  var message;
  var baseUrl = 'https://sara-my-store.000webhostapp.com/api/login';
  Future<String> signIn(String email,String pass) async {
    var url = baseUrl + '/api/login';
    var uri = Uri.parse(baseUrl);
    var response = await http.post(

      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {'email':email,'password':pass},
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(response.body);
      token = responsejeson['access_token'];
// message=responsejeson['success'];
   t=token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }
}
