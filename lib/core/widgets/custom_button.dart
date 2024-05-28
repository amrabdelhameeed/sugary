import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8),
          backgroundColor: AppColors.appColorDarkMode,
          fixedSize: Size(320.w, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        onPressed: onTap,
        child: CustomText(
          num: 25,
          word: text,
          color: Colors.white,
        ));
  }
}
