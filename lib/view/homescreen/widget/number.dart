import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/homescreen/cubit/home_cubit.dart';

import '../../../model/color/dart color.dart';

class NumberCustom extends StatelessWidget {
  const NumberCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Text(
          '${HomeCubit.get(context).status}'.substring(0,5),
          style: TextStyle(
            color: AppColor.greencolor,
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
          ),
        ),
        SizedBox(height: 10.h,),
        Text(
          'mg/dl',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
