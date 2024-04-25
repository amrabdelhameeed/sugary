import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carlous extends StatelessWidget {
  const Carlous({super.key, required this.pict});
final List pict;
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
        items:  List.generate(pict.length, (index) => Image(image:
        AssetImage(
          "${pict[index]}",
        ),
          height: 200.h,
          width: 250.w,
        ),
        ),
      ),
    );
  }
}
