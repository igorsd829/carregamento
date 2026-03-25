// import 'package:flutter/material.dart';

// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   // String url = 'https://fila-supercal-default-rtdb.firebaseio.com';
//   void postTrucks(List<String> arguments) async {
//     // This example uses the Google Books API to search for books about http.
//     // https://developers.google.com/books/docs/overview
//     var url =
//         Uri.https('https://fila-supercal-default-rtdb.firebaseio.com/json');

//     // Await the http get response, then decode the json-formatted response.
//     var response = await http.post(url);
//     if (response.statusCode == 200) {
//       var jsonResponse =
//           convert.jsonEncode('truck') as Map<String, dynamic>;
//       var user = jsonResponse;
//       print('Number of books about http: .');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
// }
