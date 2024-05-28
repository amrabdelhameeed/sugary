import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomSheets {
  AppBottomSheets._();
  static buildLogout(context) async {
    return showModalBottomSheet(
      // backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
            heightFactor: 0.25,
            child: Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                    'Are you sure you want to logout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 42,
                          child: OutlinedButton(
                              child: Text('yes', style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                              onPressed: () {
                                // authCubit.userSignOut().then((value) => {context.pushReplacementNamed(AppRoutes.signIn)});
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                side: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                              )

                              //               // style: ButtonStyle(
                              //               //     backgroundColor: MaterialStateProperty.resolveWith(
                              //               //         (states) => Theme.of(context).primaryColor)),
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 42,
                          child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                                  backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).primaryColor)),
                              child: Text('no', style: TextStyle(fontSize: 16, color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
