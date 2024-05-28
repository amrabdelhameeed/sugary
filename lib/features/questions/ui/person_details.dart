import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_assets.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/models/personal_details_model.dart';
import 'package:sugar/core/widgets/custom_button.dart';
import 'package:sugar/features/auth/logic/auth_cubit.dart';

class PersonDetails extends StatefulWidget {
  const PersonDetails({super.key});

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  bool isLoading = false;

  PersonalDetailsModel personalDetailsModel = PersonalDetailsModel(isMale: true, weight: 63, age: 24, height: 163);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: BlocBuilder<AuthCubit, AuthState>(
      //     builder: (context, state) {
      //       return Text(
      //         'Hi ,${FirebaseAuth.instance.currentUser!.displayName}',
      //         style: TextStyle(
      //           fontSize: 25.sp,
      //           color: Colors.white,
      //         ),
      //       );
      //     },
      //   ),
      //   backgroundColor: AppColors.purplecolor,
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                _maleOrFemaleWidget(true, true),
                SizedBox(
                  width: 10.w,
                ),
                _maleOrFemaleWidget(false, false),
              ],
            ),
            SizedBox(height: 20.h),
            _buildSlider(
              title: 'Height',
              value: personalDetailsModel.height,
              min: 100,
              max: 250,
              onChanged: (newValue) {
                setState(() {
                  personalDetailsModel.height = newValue;
                });
              },
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: _buildAdjustableValue(
                    title: 'Weight',
                    value: personalDetailsModel.weight.toInt(),
                    onIncrement: () {
                      setState(() {
                        personalDetailsModel.weight++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (personalDetailsModel.weight > 0) personalDetailsModel.weight--;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: _buildAdjustableValue(
                  title: 'Age',
                  value: personalDetailsModel.age.toInt(),
                  onIncrement: () {
                    setState(() {
                      personalDetailsModel.age++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (personalDetailsModel.age > 0) personalDetailsModel.age--;
                    });
                  },
                )),
              ],
            ),
            SizedBox(height: 20.h),
            Spacer(),
            CustomButton(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({'personalDetails': personalDetailsModel.toJson()}).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  context.goNamed(AppRoutes.main);
                });
              },
              text: "Finish",
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }

  Widget _maleOrFemaleWidget(bool gender, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          personalDetailsModel.isMale = selected;
          setState(() {});
          print("isMale: " + personalDetailsModel.isMale.toString());
        },
        child: Container(
          height: 150.h,
          width: 150.h,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: gender ? (personalDetailsModel.isMale ? AppColors.appColorDarkMode : AppColors.pinkcolor) : (!personalDetailsModel.isMale ? AppColors.appColorDarkMode : AppColors.pinkcolor),
          ),
          child: Column(
            children: [
              Text(gender ? "Male" : "Female", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                  child: Image.asset(
                gender ? Assets.assetsPersonalDetailsMale : Assets.assetsPersonalDetailsFemale,
                // height: 100.h,
                // width: 100.w,
              )),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String title,
    required num value,
    required num min,
    required num max,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.pinkcolor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
          ),
          Text(
            value.toStringAsFixed(1) + " cm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: AppColors.color),
          ),
          Slider(
            value: value.toDouble(),
            min: min.toDouble(),
            max: max.toDouble(),
            onChanged: onChanged,
            activeColor: AppColors.filledColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAdjustableValue({
    required String title,
    required int value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Container(
      height: 150.h,
      // width: 150.w,
      padding: AppPadding.mainPadding,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.appColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 25.sp, color: AppColors.color, fontWeight: FontWeight.bold),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onDecrement,
                  child: Image.asset(Assets.assetsPersonalDetailsMinus),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: onIncrement,
                child: Image.asset(Assets.assetsPersonalDetailsAdd),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
