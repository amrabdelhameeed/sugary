// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:gurow_refactored/core/constants/app_strings.dart';
// import 'package:http/http.dart';

// class TokenHelper {
//   TokenHelper._();
//   static final _messaging = FirebaseMessaging.instance;
//   static final _user = FirebaseAuth.instance;

//   static Future<bool> checkIfUserExists() async {
//     final String? fcmToken = await _messaging.getToken();
//     final String? apiToken = await _getUserToken(_user.currentUser != null ? _user.currentUser!.uid : "");
//     if (fcmToken != null && apiToken != null) {
//       if (fcmToken == apiToken) {
//         return true;
//       } else {
//         return false;
//       }
//     } else {
//       return false;
//     }
//   }

//   static Future<bool> addUserToken() async {
//     final String? fcmToken = await _messaging.getToken();
//     return await _addUserToken(_user.currentUser != null ? _user.currentUser!.uid : "", fcmToken ?? "");
//   }

//   static Future<String?> _getUserToken(String userId) async {
//     try {
//       final response = await get(
//         Uri.parse('http://arabfinance.com:6060/api/UserToken/GetUserToken?userid=$userId'),
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         if (jsonResponse['status'] == 'true') {
//           final content = jsonResponse['content'];
//           if (content != null && content.containsKey('UserToken')) {
//             return content['UserToken'];
//           } else {
//             print('UserToken not found in the response content');
//             return null;
//           }
//         } else {
//           print('Action unsuccessful: ${jsonResponse['message']}');
//           return null;
//         }
//       } else {
//         print('Failed to get user token. Status code: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }

//   static Future<bool> _addUserToken(String userId, String userToken) async {
//     final Map<String, dynamic> body = {
//       "UserId": userId,
//       "UserToken": userToken,
//     };

//     final response = await post(
//       Uri.parse('${AppStrings.afUrl}/api/UserToken/AddUserToken'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(body),
//     );
//     print(response.body);

//     if (response.statusCode == 200) {
//       print('User token added successfully');
//       return true;
//     } else {
//       // print(response.body);
//       print('Failed to add user token');
//       return false;
//     }
//   }
// }
