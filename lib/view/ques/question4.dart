import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/homescreen/screens/bottom.dart';

import '../../model/color/dart color.dart';
import '../../model/move/Navigation.dart';
import 'cubit/ques_cubit.dart';

class Question4 extends StatelessWidget {
   Question4({super.key});
  List<String> text4 = [
    "mg/dL",
    "mmol/L",
    "g",
    "ex",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenaccent,
      appBar: AppBar(
        backgroundColor: AppColor.greenaccent,
      actions: [  IconButton(
            onPressed: (){
              Move.moveAndReplace(context, Bottom());
            },
            icon: Icon(Icons.arrow_forward_ios_sharp,
              size: 30.sp,
              color: Colors.black,
            )
        ),
        SizedBox(width: 10.w,),
        ],
      ),
      body:  Column(
        children: [
          SizedBox(height: 25.h,),
          Text(
            "Choose insulin ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(
            "Therapy:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
            ),
          ),
          SizedBox(height: 25.h,),

          Center(
            child: BlocBuilder<QuesCubit,QuesState>(
              builder: (context, state) {
                var quescubit = QuesCubit.get(context);
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    height: 450.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h,),
                          Text(
                            " Blood sugar ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          ElevatedButton(
                            onPressed: (){
                              quescubit.answers[3].add("Asnswer41");
                            },
                            child: Text(
                              text4[0],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black,width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              fixedSize: Size(320, 60),
                              backgroundColor:  Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          ElevatedButton(
                            onPressed: (){
                              quescubit.answers[3].add("Asnswer42");
                            },
                            child: Text(
                              text4[1],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black,width: 2),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              fixedSize: Size(320, 60),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 40.h,),
                          Text(
                            "Carbs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          ElevatedButton(
                            onPressed: (){
                              quescubit.answers[4].add("Asnswer51");
                            },
                            child: Center(
                              child: Text(
                                text4[2],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black,width: 2),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              fixedSize: Size(320, 60),
                              backgroundColor:  Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          ElevatedButton(
                            onPressed: (){
                              quescubit.answers[4].add("Asnswer52");
                            },
                            child: Text(
                              text4[3],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black,width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              fixedSize: Size(320, 60),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
