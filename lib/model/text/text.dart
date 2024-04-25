import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.word, required this.num});
final String word;
final int num;

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        color: Colors.white,
        fontSize: num.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
