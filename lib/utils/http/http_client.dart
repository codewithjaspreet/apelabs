// import 'dart:convert';
// // import 'package:http/http.dart' as http;
//
// class THttpHelper {
//   static const String _baseUrl = 'BASE_URL';
//   static const String _apiKey = 'API_KEY';
//   static const String _apiSecret = 'API_SECRET';
//
//   static String get apiKey => _apiKey;
//   static String get apiSecret => _apiSecret;
//   static String get baseUrl => _baseUrl;
//
//   // Helper method to make a GET request
//   static Future<Set> get(String endpoint) async {
//     final response = await http.get(Uri.parse('$_baseUrl/$endpoint'), headers: {
//       'authorization': 'token $apiKey:$apiSecret',
//     });
//     return _handleResponse(response);
//   }
//
//   // Helper method to make a POST request
//   static Future<Set> post(String endpoint, dynamic data) async {
//     final response = await http.post(
//       Uri.parse('$_baseUrl/$endpoint'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'token $apiKey:$apiSecret'
//       },
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }
//
//   // Helper method to make a PUT request
//   static Future<Set> put(String endpoint, dynamic data) async {
//     final response = await http.put(
//       Uri.parse('$_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }
//
//   // Helper method to make a DELETE request
//   static Future<Set> delete(String endpoint) async {
//     final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }
//
//   // Handle the HTTP response
//   static Set _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return {response.statusCode, json.decode(response.body)};
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }
//
// // https://app.prosessed.com/api/resource/Planner?fields=["*"]&filters=[["owner","=","navneetmaheshwari99@gmail.com"]]
