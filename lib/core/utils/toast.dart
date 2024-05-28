// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gurow_refactored/features/dahab_masr/ui/widgets/result_sheet.dart';

// class AppPopUps {
//   AppPopUps._();
//   static void openToast({required BuildContext context, required String message, bool isDurationLong = false}) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: isDurationLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       fontSize: 16.0,
//     );
//   }

//   static showResultSheet({required BuildContext context, void Function()? callback, String? cancel, String? confirm, required String description, bool? isSuccess}) {
//     return showModalBottomSheet(
//       useRootNavigator: true,
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       builder: (context) {
//         return ResultSheet(
//           description: description,
//           callback: callback,
//           cancel: cancel,
//           confirm: confirm,
//           isSuccess: isSuccess,
//         );
//       },
//     );
//   }
// }

// // //sort length
// // void openToast(context, message) {
// //   Fluttertoast.showToast(
// //     msg: message,
// //     toastLength: Toast.LENGTH_SHORT,
// //     gravity: ToastGravity.BOTTOM,
// //     timeInSecForIosWeb: 1,
// //     fontSize: 16.0,
// //   );
// // }

// // //long length
// // void openToast1(context, message) {
// //   Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, fontSize: 16.0);
// // }
