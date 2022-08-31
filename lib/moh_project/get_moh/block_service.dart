/*


Future<String> delete(int id) async {
  final response = await http
      .get(Uri.parse('**************************************${id}')

    , headers: <String, String>{
      'Authorization': 'Bearer ${t}',
    },

  );
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

*/


