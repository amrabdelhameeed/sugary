import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/core/constants/app_colors.dart';

class RowProfile extends StatelessWidget {
  const RowProfile({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.purplecolor,
        border: Border.all(
          color: AppColors.greycolor,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
              ),
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 30.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
