import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/ques/question4.dart';

import '../../model/color/dart color.dart';
import '../../model/move/Navigation.dart';
import 'cubit/ques_cubit.dart';

class Question3 extends StatelessWidget {
   Question3({super.key});
  List<String> text3 = [
    "Syringes",
    "Pump",
    "No Pump",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orangeaccent,
      appBar: AppBar(
        backgroundColor: AppColor.orangeaccent,
        actions: [
          IconButton(
              onPressed: (){
                Move.moveAndReplace(context, Question4());
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 15.h,),
                            ElevatedButton(
                              onPressed: (){
                                quescubit.answers[2].add("Asnswer31");
                              },
                              child: Text(
                                text3[0],
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
                                quescubit.answers[2].add("Asnswer32");
                              },
                              child: Text(
                                text3[1],
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
                                quescubit.answers[2].add("Asnswer33");
                              },
                              child: Center(
                                child: Text(
                                  text3[2],
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
                            SizedBox(height: 15.h,),
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
