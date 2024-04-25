import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/custombutton/custombutton.dart';
import 'package:sugar/model/rowprofile.dart';
import 'package:sugar/model/text/text3.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:sugar/view/homescreen/cubit/profilecubit/profile_cubit.dart';
import 'package:sugar/view/homescreen/cubit/profilecubit/profile_cubit.dart';

import '../../../model/color/dart color.dart';
import '../../../model/visible/visible.dart';
import '../../detailscreens3/first/Cubit/BMI.dart';
import '../../detailscreens3/first/Cubit/cubit.dart';
import '../../ques/cubit/ques_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            List text = ["Diabetes Type","Diabetes Therapy","BGM Device","units"];
            List explains = ["${QuesCubit.get(context).answers[0]}" ?? '',"${QuesCubit.get(context).answers[2]}" ?? "","......","mg/dL"];
            var cubit = ProfileCubit.get(context);
            return Column(
              children: [
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    SizedBox(width: 8.w,),
                    Visible(
                        status: cubit.picture == null,
                        picture: cubit.picture?.path, on: () {
                      cubit.AddPicture();
                    }),
                    SizedBox(width: 10.w,),
                    BlocBuilder<AuthCubit,AuthState>(
                        builder: (context, state) {
                          var authcubit = AuthCubit.get(context);
                          return Custom3Text(
                              word: "${authcubit.nameController.text}", num: 30,
                          );
                        },
                    )
                  ],
                ),
                SizedBox(height: 10.h,),
                GridView.count(
                  padding: EdgeInsets.only(
                      left : 20.sp,
                    right: 20.sp
                  ),
                  childAspectRatio: 5/3,
                    crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  children: List.generate(text.length, (index) =>
                      Container(
                        width: 140.w,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColor.purplecolor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(
                                text[index],
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h,),
                            Center(
                              child: Text(
                                explains[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                  ),
                ),

                SizedBox(
                  height: 121.h,
                ),
                RowProfile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              color: AppColor.purplecolor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            height: 300.h,
                            width: 400.w,
                            child: BlocBuilder<AuthCubit,AuthState>(
                              builder: (context, state) {
                                var authcubit = AuthCubit.get(context);
                                return BlocBuilder<BMICupit,BMIState>(
                                  builder: (context, state) {
                                    var cubit = BMICupit.get(context);
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Personal Details',
                                            style: TextStyle(
                                              fontSize: 30.sp,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                          ' My Name is ${authcubit.nameController.text}',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                          ' My Gender is ${cubit.male == true ? "Male" : "Female"}',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                          ' My Hight is ${cubit.hight} CM',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                          ' My Weight is ${cubit.weight} KG',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text(
                                          ' My Age is ${cubit.Age} Years',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: "Personal Details",
                ),
                RowProfile(
                  onTap: (){},
                  text: "Address",
                ),
                RowProfile(
                  onTap: (){},
                  text: "Address",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
