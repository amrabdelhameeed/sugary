import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/model/custombutton/custombutton.dart';
import 'package:sugar/model/move/Navigation.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:sugar/view/ques/question.dart';

import 'Cubit/BMI.dart';
import 'Cubit/Gender/itemWidget.dart';
import 'Cubit/cubit.dart';

class PersonDetail extends StatelessWidget {
  const PersonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: BlocBuilder<AuthCubit,AuthState>(
          builder: (context, state) {
            var authcubit = AuthCubit.get(context);
            return Text(
              'Hi ,${authcubit.nameController.text}',
              style: TextStyle(
                fontSize: 25.sp,
                color: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: AppColor.purplecolor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:EdgeInsetsDirectional.all(12),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: BlocBuilder<BMICupit, BMIState>(
                        builder: (context, state){
                          var cubit = BMICupit.get(context);
                          return Row(
                            children: [
                              Expanded(
                                child: ItemWidget(
                                  isSelected : cubit.male,
                                  onTap: (){
                                    cubit.ChangeGender(true);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.male_outlined,
                                        color:Colors.blue ,
                                        size: 30,
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text(
                                        'Male',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),
                              Expanded(
                                child: ItemWidget(
                                  isSelected : !cubit.male,
                                  onTap: (){
                                    cubit.ChangeGender(false);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.female_outlined,
                                        color:Colors.redAccent ,
                                        size: 30,
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text(
                                        'Female',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        buildWhen: (previous, current) {
                          return current is GenderState;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: BlocBuilder<BMICupit,BMIState>(
                        builder: (context, state) {
                          var cubit = BMICupit.get(context);
                          return ItemWidget(
                            onTap: (){
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hight',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(height: 3.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${cubit.hight}'.substring(0,5),
                                      style: TextStyle(
                                        color: AppColor.color,
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.w,),
                                    Text(
                                      'cm',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h,),
                                Slider(
                                    value: cubit.hight,
                                    min: 100,
                                    max: 200,
                                    activeColor: Colors.pink,
                                    onChanged:(value){
                                      cubit.ChangeHight(value);
                                    }
                                ),
                              ],
                            ),
                          );
                        },
                        buildWhen: (previous, current) {
                          return current is HeightState;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<BMICupit,BMIState>(
                              builder: (context, state) {
                                var cubit = BMICupit.get(context);
                                return ItemWidget(
                                  onTap: (){
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Wight',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.h,),
                                      Text(
                                        '${cubit.weight}',
                                        style: TextStyle(
                                          color: AppColor.color,
                                          fontSize: 25.sp,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          FloatingActionButton(
                                            onPressed: (){
                                              cubit.SubstractWeight();
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
                                          SizedBox(width: 5.w,),
                                          FloatingActionButton(
                                            onPressed: (){
                                              cubit.AddWeight();
                                            },
                                            child:
                                            Text(
                                              ' + ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            backgroundColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 6.w,),
                          Expanded(
                            child: BlocBuilder<BMICupit,BMIState>(
                              builder: (context, state) {
                                var cubit = BMICupit.get(context);
                                return ItemWidget(
                                  onTap: (){},
                                  child: Column(
                                    children: [
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      SizedBox(height: 2.h,),
                                      Text(
                                        '${cubit.Age}',
                                        style: TextStyle(
                                          color: AppColor.color,
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          FloatingActionButton(
                                            onPressed: (){
                                              cubit.SubstractAge();
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
                                          SizedBox(width: 5.w,),
                                          FloatingActionButton(
                                            onPressed: (){
                                              cubit.AddAge();
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
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onTap: (){
              Move.moveAndReplace(context, Question1());
            },
               text: ' Get Started ',
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
