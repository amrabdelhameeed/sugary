// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class LoadingSpinner {
//   late BuildContext context;

//   LoadingSpinner(this.context);

//   // this is where you would do your fullscreen loading
//   Future<void> startLoading() async {
//     return await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           elevation: 0.0,
//           backgroundColor: Colors.transparent, // can change this to your prefered color
//           children: <Widget>[
//             Center(
//               child: Center(
//                   child: SpinKitPulse(
//                 color: Theme.of(context).primaryColor,
//               )),
//             )
//           ],
//         );
//       },
//     );
//   }

//   Future<void> stopLoading() async {
//     Navigator.of(context).pop();
//   }

//   Future<void> showError(Object? error) async {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         action: SnackBarAction(
//           label: 'Dismiss',
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           },
//         ),
//         backgroundColor: Colors.red,
//         content: Text(error.toString()),
//       ),
//     );
//   }
// }
