
/*
import 'dart:convert';

import 'model_page1.dart';
import 'package:http/http.dart' as http;

Future<Page1> fetchAlbum() async {
  final response = await http.get(Uri.parse(url2+urlPlus));
  if (response.statusCode == 200) {
    print("URLPlus ${response}$urlPlus");

    // If te server did return a 200 OK response,
    // then parse the JSON.
    return Page1.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw  ('Failed to load album');
  }
}

void initState() {
  super.initState();
  futureData = fetchAlbum();
}

 */