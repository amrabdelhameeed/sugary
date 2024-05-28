import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.word, this.num = 25, this.color = Colors.black});
  final String word;
  final int num;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        color: color,
        fontSize: num.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
