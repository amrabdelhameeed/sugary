// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:gurow_refactored/app_router.dart';
// import 'package:gurow_refactored/core/constants/app_routes.dart';

// class NotificationNavigation {
//   static void initNotificationNavigation() {
//     // Handling initial message when the app is not running
//     FirebaseMessaging.instance.getInitialMessage().then((value) {
//       debugPrint("FROM INITIAL MESSAGE");
//       if (value != null && value.data.isNotEmpty && value.data['id'] != null) {
//         int? id = int.tryParse(value.data['id'].toString());
//         String? type = value.data['type'];
//         if (id != null && type != null) {
//           debugPrint(value.data.toString());
//           navigateToCustomPage(id, type);
//         }
//       }
//     });

//     // Handling message when the app is already open
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       debugPrint("FROM ON MESSAGE OPENED APP");
//       debugPrint(event.data.toString());
//       if (event.data.isNotEmpty && event.data['id'] != null) {
//         int? id = int.tryParse(event.data['id'].toString());
//         String? type = event.data['type'];
//         if (id != null && type != null) {
//           navigateToCustomPage(id, type);
//         }
//       }
//     });
//   }

//   static void navigateToCustomPage(int? id, String type) {
//     if (id != null) {
//       switch (type) {
//         case 'EGX':
//           AppRouter.router.pushNamed(AppRoutes.packages, extra: 1);
//           break;
//         case 'SUBSCRIBER':
//           // Handle SUBSCRIBER case if needed
//           break;
//         case 'OPTOFOLIO':
//           AppRouter.router.pushNamed(AppRoutes.packages, extra: 2);

//           break;
//         case 'NEWS':
//           AppRouter.router.pushNamed(AppRoutes.newsDetailWithId, pathParameters: {"newdetails": id.toString()});
//           break;
//         default:
//           // Handle default case if needed
//           break;
//       }
//     }
//   }
// }
