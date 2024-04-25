import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';

class Custom3Text extends StatelessWidget {
  const Custom3Text({super.key, required this.word, required this.num});
  final String word;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        color: Colors.black,
        fontSize: num.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}