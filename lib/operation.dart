/*import 'dart:convert';
import 'dart:async';
import 'package:midterm/models/pic.dart';
import 'package:http/http.dart' as http;

Future<List<pic>> fetchpic() async {
  final response =
      await http.get('https://foodish-api.herokuapp.com/');
  if (response.statusCode == 200) {
    return decodepic(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<pic> decodepic(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<pic>((json) => pic.fromMap(json)).toList();
}

Future<pic> sendpic(
    String title, int id, String imageurl, int quantity) async {
  final http.Response response = await http.post(
    'https://foodish-api.herokuapp.com/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'imageurl': imageurl,
      'quantity': quantity.toString()
    }),
  );
  if (response.statusCode == 201) {
    return pic.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<pic> deletepic(int id) async {
  final http.Response response = await http.delete(
    'url/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return pic.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete Pic.');
  }
}*/
