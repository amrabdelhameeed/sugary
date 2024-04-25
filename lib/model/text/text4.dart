import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';

class Custom4Text extends StatelessWidget {
  const Custom4Text({super.key, required this.word, required this.num, required this.color});
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