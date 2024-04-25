import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:sugar/view/homescreen/cubit/home_cubit.dart';



class HomeScreen2 extends StatelessWidget {
   HomeScreen2({super.key});
 List pic = ["assets/im/1home2.png","assets/im/2home2.png","assets/im/3home2.png"];
 List text = ["Glucose Reading","Insulin","Medication"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 2,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${cubit.nameController.text} ...",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150.h,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BlocBuilder<HomeCubit,HomeState>(
                            builder: (context, state) {
                              var cubit = HomeCubit.get(context);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 40.h,),
                                      Container(
                                        width: 170.w,
                                        height: 110.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: AppColor.purplecolor,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15.h,),
                                            Text(
                                              '${cubit.sugar}'.substring(0,5),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 6.w,),
                                  Container(
                                    width: 160.w,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            "assets/im/homeicon.png",
                                          ),
                                          width: 100.w,
                                          height: 70.h,
                                        ),
                                        SizedBox(height: 10.h,),
                                        Container(
                                          padding: EdgeInsets.all(12),
                                          width: 135.w,
                                          height: 70.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: AppColor.purplecolor,
                                          ),
                                          child: Text(
                                            cubit.sugar < 180 ? "All Under \n Control !" : "Be Careful !" ,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ],
                              );
                            },
                            buildWhen: (previous, current) {
                              return current is PatintState;
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(0.1),
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white
                          ],
                        ),
                        color: AppColor.purplecolor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 3.h,),
                          Container(
                            width: 220.w,
                            padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                      color: AppColor.purplecolor,
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      ),
                            child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                  Image(
                                                  image: AssetImage(
                                                  pic[0],
                                                  ),
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                  SizedBox(height: 8.h,),
                                                  Center(
                                                    child: Text(
                                                      text[0],
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                        fontSize: 25.sp,
                                                      ),
                                                    ),
                                                  ),
                                      ],
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Container(
                            width: 220.w,

                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColor.purplecolor,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage(
                                    pic[1],
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                                SizedBox(height: 8.h,),
                                Center(
                                  child: Text(
                                    text[1],
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Container(
                            width: 220.w,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColor.purplecolor,
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage(
                                    pic[2],
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                                SizedBox(height: 8.h,),
                                Center(
                                  child: Text(
                                    text[2],
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h,),

                        ],
                      )
                    ),
                  ),


                ],
              ),
            );
          },
        )
    );
  }
}
