import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/constants/app_routes.dart';

class MyFolderScreen extends StatelessWidget {
  const MyFolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPadding.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.myFolderGlucose);
              },
              child: Container(
                alignment: Alignment.center,
                height: 150.h,
                decoration: BoxDecoration(color: AppColors.appColor, borderRadius: BorderRadius.circular(15)),
                child: Text("Glucose reading", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.myFolderCumulative);
              },
              child: Container(
                alignment: Alignment.center,
                height: 150.h,
                decoration: BoxDecoration(color: AppColors.appColor, borderRadius: BorderRadius.circular(15)),
                child: Text("Cumulative sugar", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
