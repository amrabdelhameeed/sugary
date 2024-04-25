import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/ques/question3.dart';

import '../../model/color/dart color.dart';
import '../../model/move/Navigation.dart';
import 'cubit/ques_cubit.dart';

class Question2 extends StatelessWidget {
   Question2({super.key});
  List<String> text2 = [
    "Accu-Check Guide Me",
    "Accu-Check Instant",
    "Other device",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pinkaccent,

      appBar: AppBar(
        backgroundColor: AppColor.pinkaccent,
        actions: [
          IconButton(
              onPressed: (){
                Move.moveAndReplace(context, Question3());
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
            "  Which meter  ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(
            "do you use?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
            ),
          ),
          SizedBox(height: 25.h,),

          BlocBuilder<QuesCubit,QuesState>(
            builder: (context, state) {
              var quescubit = QuesCubit.get(context);
              return Center(
                child: Container(
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
                            quescubit.answers[1].add("Asnswer21");
                          },
                          child: Text(
                            text2[0],
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
                        SizedBox(height: 15.h,),
                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[1].add("Asnswer22");
                          },
                          child: Text(
                            text2[1],
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
                        SizedBox(height: 15.h,),
                        ElevatedButton(
                          onPressed: (){
                            quescubit.answers[1].add("Asnswer23");
                          },
                          child: Center(
                            child: Text(
                              text2[2],
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
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15.h,),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}
