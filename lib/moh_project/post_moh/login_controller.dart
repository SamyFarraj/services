import 'dart:convert';

import 'package:http/http.dart' as http;

String theToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmY1MDQwN2NhZjdkYjllZmRlODc3MWM2MjE0N2RkMDVkNDk0YjljYWVhYjc2MWM3NDA3MmU4NWIzN2RkZWJmOWYxNzI0ZTE0Yzg2ZTQ3NzIiLCJpYXQiOjE2NjE2MTA3MTEuMDExNTMsIm5iZiI6MTY2MTYxMDcxMS4wMTE1MzIsImV4cCI6MTY5MzE0NjcxMS4wMDUzNDEsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.IMXzkIVtKR8Zv9EsosvGFHr4144ZndTmOcOomYdvELZi1JvjGSRnafcEEu240wiws3fiGNEfojjRwwZTgDIWGaA1vxORphrtlwNp5ui4e3Chn59QShEhJdjp-HP4aMgpWG3zaoIQbcPaq0oCNS2o84xeLCpSAV24nL3Q__T0gfDve-Tmnfp3F7FdvZbzsTIoXZO4w5T5XdEtQ3zm7-N-KgdZCP9NASXk23VV5L1451P8QeSQzX5R2dgHAqTcu-hm0EA9M1SW8WX8D8qK6PVVudDaYDEwp5QCdERI4aOS6U0ZJE_j4ZHgvyt1Q_cCc32rIXNEo8JbrS7P9g7GVnwVvdxXIgjnCXBW3VtAI1--o26_8nM-UVptkDcByU_IuKE_jtBQBtRhj3Eau_OJfFvw7H6TU_pOgKdBMdDx0Z_SIWbduVorOHjO-WjeHBDX5qafJCHi6D16DMuKvVPSjY-uO787u0tVhTq3QCnDKCHFL06bM17ULQO-Gkd_Xl_PgufVDyNicCw2IE5jc0jqn0cjrldWiBYK_kfgjz0UJROhdB9NV_wvW9af0gdpt2EWIHrGDZxaHHZDlVK3gfVYo7CFbHwiTWIh8s2g2KxT4yfqvNV2UMg_cylNmAuNdgLUXVZ3FetDJYiXVaH1mXkQQuT8AgXfkDzy-5UrXoE1xM8J4Pw';

class loginController {
  var token;
  var message;
  var baseUrl = 'https://sara-my-store.000webhostapp.com/api/login';

  Future<String> signIn(
    String email,
    String pass,
  ) async {
    // var url = baseUrl + '/api/login';
    var uri = Uri.parse(baseUrl);
    var response = await http.post(
      uri,
      headers: <String, String>{
        'accept': 'application/json',
      },
      body: {
        'email': email,
        'password': pass,
      },
    );
    print("${response.body}");

    if (response.statusCode == 200) {
      var responsejeson = jsonDecode(
        response.body,
      );
      token = responsejeson['access_token'];
// message=responsejeson['success'];
      theToken = token;
      // return jsonDecode(response.body)['access_token'];
      return token;
    } else {
      return 'fail';
    }
  }
}
