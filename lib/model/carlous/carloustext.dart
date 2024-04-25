import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/text/text.dart';

import '../text/text3.dart';

class CarlousText extends StatelessWidget {
  const CarlousText({super.key, required this.text, required this.text2, required this.text3});
  final List text;
  final List text2;
  final List text3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlayAnimationDuration: Duration(
            milliseconds: 900,
          ),
          animateToClosest: true,
        ),
        items:  List.generate(text.length, (index) => Column(
          children: [
            Custom3Text(word: text[index], num: 20),
            SizedBox(height: 4.h,),
            Custom3Text(word: text2[index], num: 20),
            SizedBox(height: 4.h,),
            Custom3Text(word: text3[index], num: 20),
          ],
        ),
        ),
      ),
    );
  }
}
