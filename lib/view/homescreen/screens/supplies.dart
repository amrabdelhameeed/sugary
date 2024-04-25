import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/model/move/Navigation.dart';
import 'package:sugar/view/homescreen/screens/emergency.dart';

class Supplies extends StatelessWidget {
   Supplies({super.key});
List pic = [
      "assets/im/emergency.png",
      "assets/im/folder.png",
      "assets/im/midecine.png",
      "assets/im/nurse.png",
      "assets/im/laboratory.png",
      "assets/im/tips.png",
];
List title = [
     "Emergency Contacts",
     "My Folder",
     "Medication Reminders",
     "My Doctor",
     "Laboratory",
     "Tips",
   ];
List screens = [
Emergency()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: List.generate(pic.length, (index) =>
                    InkWell(
                      onTap: (){
                        Move.move(context, screens[0]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColor.purplecolor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(
                                pic[index],
                              ),
                              height: 60,
                              width: 60,
                            ),
                            Center(
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 25.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
