import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:sugar/view/homescreen/cubit/home_cubit.dart';
import 'package:sugar/view/homescreen/widget/number.dart';
import 'package:sugar/view/homescreen/widget/slider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState(){
    HomeCubit.get(context).ChangeStatus(HomeCubit.get(context).status);
    HomeCubit.get(context).ChangeComment(HomeCubit.get(context).comment ?? "");
    super.initState();
  }
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
                                      InkWell(
                                        child: Container(
                                          width: 170.w,
                                          height: 110.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: AppColor.purplecolor,
                                          ),
                                          child: NumberCustom()
                                        ),
                                        onTap: (){
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 10.h,),
                                                 SliderCustom(),
                                                ],
                                              );
                                            },
                                          );
                                        },

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
                                          child: Center(
                                            child: Text(
                                              cubit.comment ?? "",
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                              ),
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
                  SizedBox(height: 30.h,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(0.1),
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [
                            AppColor.purplecolor,
                            Colors.white54,
                          ],
                        ),
                        color: AppColor.purplecolor,
                      ),
                      child: Column(
                        children: [

                          Text(
                             DateTime.now().year.toString() + " / " +DateTime.now().month.toString() + " / " +DateTime.now().day.toString(),
                            style: TextStyle(
                              color: AppColor.pinkcolor,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColor.greycolor,
                                child: Column(
                                  children: [
                                    SizedBox(height: 3.h,),
                                    Image(image: AssetImage(
                                      "assets/im/Water Glass.png",
                                    ),
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    Center(
                                      child: Text(
                                        "0%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                radius: 40.sp,

                              ),
                              CircleAvatar(
                                backgroundColor: AppColor.greycolor,

                                child: Column(
                                  children: [
                                    SizedBox(height: 3.h,),
                                    Image(image: AssetImage(
                                      "assets/im/Sleeping in Bed.png",
                                    ),
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    Center(
                                      child: Text(
                                        "0%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                radius: 40.sp,

                              ),
                              CircleAvatar(
                                backgroundColor: AppColor.greycolor,
                                child: Column(
                                  children: [
                                    SizedBox(height: 3.h,),
                                    Image(image: AssetImage(
                                      "assets/im/Track and Field.png",
                                    ),
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    Center(
                                      child: Text(
                                        "0%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                radius: 40.sp,

                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          BlocBuilder<HomeCubit,HomeState>(
                              builder: (context, state) {
                                var cubit = HomeCubit.get(context);
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(height: 10.h,),
                                                Image(image: AssetImage(
                                                  "assets/im/Water Glass.png",
                                                ),
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                                SizedBox(height: 10.h,),

                                                SizedBox(height: 15.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.SubstractWater();
                                                      },
                                                      child:
                                                      Text(
                                                        ' - ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                    SizedBox(width: 15.w,),
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.AddWater();
                                                      },
                                                      child:
                                                      Text(
                                                        ' + ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 15.h,),

                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text("${cubit.waterbottel} out of 10",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(height: 10.h,),
                                                Image(image: AssetImage(
                                                  "assets/im/Sleeping in Bed.png",
                                                ),
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                                SizedBox(height: 10.h,),

                                                SizedBox(height: 15.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.Substractsleep();
                                                      },
                                                      child:
                                                      Text(
                                                        ' - ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                    SizedBox(width: 15.w,),
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.AddSleep();
                                                      },
                                                      child:
                                                      Text(
                                                        ' + ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 15.h,),

                                              ],
                                            );
                                          },
                                        );
                                      },

                                      child: Text("  ${cubit.sleep} out of 8  ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(height: 10.h,),
                                                Image(image: AssetImage(
                                                  "assets/im/Track and Field.png",
                                                ),
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                                SizedBox(height: 10.h,),

                                                SizedBox(height: 15.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.Substractsport();
                                                      },
                                                      child:
                                                      Text(
                                                        ' - ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                    SizedBox(width: 15.w,),
                                                    FloatingActionButton(
                                                      onPressed: (){
                                                        cubit.AddSport();
                                                      },
                                                      child:
                                                      Text(
                                                        ' + ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 15.h,),

                                              ],
                                            );
                                          },
                                        );
                                      },

                                      child: Text("${cubit.sport} out of 10.000",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                          ),
                        ],
                      ),
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
