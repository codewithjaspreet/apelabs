// class UserLocalDataSource {
//   static const String _sidKey = 'sid';
//   static const String _apiKey = 'api_key';
//   static const String _apiSecretKey = 'api_secret';
//   static const String _usernameKey = 'username';
//   static const String _emailKey = 'email';
//   static const String _fullNameKey = 'full_name';
//
//   Future<void> saveUser(UserModel user) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_sidKey, user.sid);
//     await prefs.setString(_apiKey, user.apiKey);
//     await prefs.setString(_apiSecretKey, user.apiSecret);
//     await prefs.setString(_usernameKey, user.username);
//     await prefs.setString(_emailKey, user.email);
//     await prefs.setString(_fullNameKey, user.fullName);
//   }
//
//   Future<UserModel?> getUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     final sid = prefs.getString(_sidKey);
//     final apiKey = prefs.getString(_apiKey);
//     final apiSecret = prefs.getString(_apiSecretKey);
//     final username = prefs.getString(_usernameKey);
//     final email = prefs.getString(_emailKey);
//     final fullName = prefs.getString(_fullNameKey);
//
//     if (sid != null &&
//         apiKey != null &&
//         apiSecret != null &&
//         username != null &&
//         email != null &&
//         fullName != null) {
//       return UserModel(
//         sid: sid,
//         apiKey: apiKey,
//         apiSecret: apiSecret,
//         username: username,
//         email: email,
//         fullName: fullName,
//       );
//     } else {
//       return null;
//     }
//   }
//
//   Future<void> clearUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_sidKey);
//     await prefs.remove(_apiKey);
//     await prefs.remove(_apiSecretKey);
//     await prefs.remove(_usernameKey);
//     await prefs.remove(_emailKey);
//     await prefs.remove(_fullNameKey);
//   }
// }
