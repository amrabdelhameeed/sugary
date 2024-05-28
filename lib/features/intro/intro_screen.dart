import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/widgets/carloustext.dart';
import 'package:sugar/core/widgets/custom_button.dart';
import 'package:sugar/core/widgets/custom_text.dart';
import 'package:sugar/core/widgets/carlous/carlous.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pict = [
    "assets/im/pic1.jpg",
    "assets/im/pic3.jpg",
    "assets/im/pic2.jpg",
  ];
  List<String> texts = [
    "Your friend alongside\nyour diabetes journey.",
    "You are not ill, your pancreas\nis just lazy.",
    "This Sugary app made for people with diabetes by pepole with diabetes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 0.7.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60.r),
                  bottomLeft: Radius.circular(60.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      const CustomText(word: "Welcome To", num: 40),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      Text(
                        "     Sugary",
                        style: TextStyle(
                          color: AppColors.redaccentcolor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.2,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0, // This ensures only one page is visible at a time
                      autoPlayAnimationDuration: const Duration(milliseconds: 900),
                      animateToClosest: true,
                    ),
                    items: List.generate(
                      pict.length,
                      (index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              flex: 4,
                              child: Image(
                                image: AssetImage(pict[index]),
                                // height: 150.h,
                                // width: 250.w,
                              )),
                          const Expanded(child: SizedBox()),
                          Expanded(
                              flex: 3,
                              child: Text(
                                texts[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp, // Adjust the font size accordingly
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              onTap: () {
                // Move.moveAndReplace(context, Register());
                context.pushReplacementNamed(AppRoutes.signUp);
              },
              text: "Get Started",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(word: "Already Have An Acount ?", num: 15, color: Colors.grey),
                TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.signIn);
                  },
                  child: const CustomText(
                    word: "Log in",
                    num: 17,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
