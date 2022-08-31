import 'dart:convert';

import 'package:http/http.dart' as http;

String theToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2FkYTBjZWRkOGNkODNjMWVkMDg5ZDU0N2U0ZjgzMjA2YjhjMzU4NDhjMWUyMjViYjE5ZjA0NzYxMDZjYjM2Y2I1NmEyYjUzMDA5NmU1NjMiLCJpYXQiOjE2NTk0NDIzMTcuMzk2NTE5LCJuYmYiOjE2NTk0NDIzMTcuMzk2NTIyLCJleHAiOjE2OTA5NzgzMTcuMzg4NzQzLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.VKekVtWHQozb0ItAN23O2F0qCNIwAIZDU5BOk1VBfY_BouxLRE1gacoNDEZMHEthUrNdBapjwzVs98nVZ5dlQN4VpYFb0Z21AsX6WtJM3o-3jwX38h249jZFykqH__X7PmHc-Exix2V0uGYVAB1yUHdvvtQ16IL136lZYiR99ntKzwu9WP5GcZzL6CXoo_grmH-J-gueC7-FKnDBw5NgrSIEyJ4bJI1d6tsRzHVRWxWhKxd9flXAnv69gCrYsNF4YNsMB-f8FRdJN28wWZdQrC_ScfrGRrkH8QkYiRiLEMEvfkrJsoCEOAgJUu_0t-arc5Z7-d6klg4nV8jdL_C7x272z74Vtt7lI1QxZVgCU2g27AOyohi55lH5DWhJ2AghLF68_AVHdrfSwKD8fBJRJIK1Nqi3zT-mvF29EOHIJnhPsvHeznjFHt4Ou-CZTP_NY8t1i_sqWpx4D-lokZjCOXrzdyuB9VXkHNS0ubF0btwon6TNd5HsozecxPUyk0o15iZV7scBN53s8kGafO3l6HBvn1F3-vtWMLBkldeTtD9iUC3F7HAe_0NNIuGRUI3F5uJk2VFY2zNZHWpGqwn9eZlPNr-dOwrPmtXjaM2slb91Ysid9O29r_7RY1-bVGVIG6iTexyKDhzcVZnyKZwFaDJbsfbX_DSic-8rPB7wnRQ';

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
