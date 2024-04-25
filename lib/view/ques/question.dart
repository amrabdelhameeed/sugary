import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/move/Navigation.dart';
import 'package:sugar/view/ques/question2.dart';

import '../../model/color/dart color.dart';
import 'cubit/ques_cubit.dart';

class Question1 extends StatelessWidget {
   Question1({super.key});
  List<String> text = [
  "Type 1",
  "Type 2",
  "Gestational Diabetes"
      " (GDM)",
  "Not Sure",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purplecolor,

      appBar: AppBar(
        backgroundColor: AppColor.purplecolor,

        actions: [
          IconButton(
              onPressed: (){
                Move.moveAndReplace(context, Question2());
              },
              icon: Icon(Icons.arrow_forward_ios_sharp,
              size: 30.sp,
                color: Colors.black,
              )
          ),
          SizedBox(width: 10.w,),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h,),
          Text(
            "Choose Diabetes",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(
            "Type",
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
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h,),
                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[0].add("Asnswer1");
                          },
                          child: Text(
                            text[0],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
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
                        SizedBox(height: 15.h,),

                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[0].add("Asnswer2");
                          },
                          child: Text(
                            text[1],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
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
                        SizedBox(height: 15.h,),

                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[0].add("Asnswer3");
                          },
                          child: Center(
                            child: Text(
                              text[2],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
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
                        SizedBox(height: 15.h,),

                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[0].add("Asnswer4");
                          },
                          child: Text(
                            text[3],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
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
                        SizedBox(height: 15.h,),

                      ],
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
