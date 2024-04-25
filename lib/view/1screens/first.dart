import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/carlous/carlous.dart';
import 'package:sugar/model/carlous/carloustext.dart';
import 'package:sugar/model/move/Navigation.dart';
import 'package:sugar/model/text/text.dart';
import 'package:sugar/view/1screens/loginscreens/screens/register.dart';

import '../../model/color/dart color.dart';
import '../../model/custombutton/custombutton.dart';
import '../../model/text/text2.dart';
import '../../model/text/text3.dart';
import '../../model/text/text4.dart';
import 'loginscreens/screens/login.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60.r),
                  bottomLeft: Radius.circular(60.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      SizedBox(width: 20.w,),
                      Custom2Text(word: "Welcome To", num: 40),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SizedBox(width: 25.w,),

                      Text(
                                       "     Sugary",
                                      style: TextStyle(
                      color: AppColor.redaccentcolor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                                      ),
                                    ),
                    ],
                  ),

                  SizedBox(height: 10.h,),
                  SizedBox(width: 10.w,),
                  Carlous(
                      pict: [
                        "assets/im/pic1.jpg",
                        "assets/im/pic3.jpg",
                        "assets/im/pic2.jpg",
                      ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            CarlousText(
                text: [
                  "Your Friend alongside,",
                  'You are not ill,',
                  'Sugary App made for',
                ],
                text2:[
                  "your diabetes journey.",
                  'your pancreas is',
                  'people with diabetes by',
                ],
              text3: [
                "",
                "just lazy",
                "people with diabetes",
              ],
                ),
            SizedBox(height: 10.h,),
            CustomButton(
              onTap: (){
                Move.moveAndReplace(context, Register());
              },
              text: "Get Started",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custom4Text(word: "Already Have An Acount ?", num: 15,color : Colors.grey),
                TextButton(onPressed: (){
                  Move.moveAndReplace(context, Login());
                },
                    child: Custom2Text(
                    word:   "Login",
                      num: 17,
                    ),),
              ],
            ),





          ],
        ),
      ),
    );
  }
}
