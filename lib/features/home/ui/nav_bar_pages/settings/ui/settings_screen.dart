import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_assets.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          GridView(
            padding: EdgeInsets.all(15.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1, mainAxisSpacing: 10.h, crossAxisSpacing: 15.w),
            shrinkWrap: true,
            children: [
              SettingsItem(
                text: "Emergency Contacts",
                icon: Image.asset(Assets.assetsAppEmergency),
                onTap: () {
                  context.pushNamed(AppRoutes.emergency);
                },
              ),
              SettingsItem(
                text: "My Folder",
                icon: Image.asset(Assets.assetsImFolder),
                onTap: () {
                  context.pushNamed(AppRoutes.myFolder);
                },
              ),
              SettingsItem(
                text: "Medication\n Reminders",
                icon: Image.asset(Assets.assetsAppMedication),
                onTap: () {
                  context.pushNamed(AppRoutes.medicationReminder);
                },
              ),
              SettingsItem(
                text: "My Doctor",
                icon: Image.asset(Assets.assetsAppNurse),
                onTap: () {
                  _showComingSoon(context);
                },
              ),
              SettingsItem(
                text: "Laboratory",
                icon: Image.asset(Assets.assetsImLaboratory),
                onTap: () {
                  _showComingSoon(context);
                },
              ),
              SettingsItem(
                text: "Meal Planing",
                icon: Image.asset(Assets.assetsAppFood),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _showComingSoon(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Coming soon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp)),
            SizedBox(
              height: 30.h,
            ),
            Text('We are working towards bringing feature to you', style: TextStyle(fontSize: 15.sp))
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Ok'))
        ],
      );
    },
  );
}

class SettingsItem extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Widget icon;

  const SettingsItem({super.key, this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 2, child: icon),
            Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
