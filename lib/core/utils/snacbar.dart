import 'package:flutter/material.dart';

void openSnacbar(BuildContext context, snacMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: Text(
        snacMessage,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
    action: SnackBarAction(
      label: 'Ok',
      textColor: Colors.blueAccent,
      onPressed: () {},
    ),
  ));
}

void openNoConnectionSnacbar(context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    padding: EdgeInsets.all(0),
    duration: Duration(days: 1),
    dismissDirection: DismissDirection.none,
    content: Container(
      color: Colors.red[100],
      padding: EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.center,
      height: 50,
      child: Text(
        "no connection",
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.4,
          color: Colors.redAccent,
          fontSize: 12,
        ),
      ),
    ),
    // action: SnackBarAction(
    //   label: 'Ok',
    //   textColor: Colors.redAccent,
    //   onPressed: () {},
    // ),
  ));
}

void dismissOpenedSnacbar(context) {
  ScaffoldMessenger.of(context).clearSnackBars();
}
