// import 'dart:convert';

// import 'package:gurow_refactored/core/models/af/username_and_password.dart';
// import 'package:gurow_refactored/core/utils/cache_helper.dart';

// class UserNameAndPasswordProvider {
//   static const _userNameAndPasswordKey = 'user_name_and_password';

//   static Future<void> setUserNameAndPassword(UserNameAndPassword? credentials) async {
//     if (credentials != null) {
//       final jsonString = credentials.toJson();
//       CacheHelper.setString(_userNameAndPasswordKey, jsonEncode(jsonString)); // Encode JSON string here
//     } else {
//       CacheHelper.remove(_userNameAndPasswordKey);
//     }
//   }

//   static Future<UserNameAndPassword?> getUserNameAndPassword() async {
//     final storedData = CacheHelper.getString(_userNameAndPasswordKey);

//     if (storedData.isEmpty) {
//       return null;
//     }

//     final decodedData = Map<String, dynamic>.from(jsonDecode(storedData));
//     return UserNameAndPassword.fromJson(decodedData);
//   }
// }
