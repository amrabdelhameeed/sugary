import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/model/custombutton/custombutton.dart';

import 'DescCubit.dart';
import 'DescState.dart';



class  ActionButton extends StatelessWidget {
   ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocConsumer<DescCubit,DescState>(
              builder: (context, state) {
                var cubit = DescCubit.get(context);
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10.h,),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            backgroundColor: AppColor.purplecolor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder:OutlineInputBorder(
                              borderSide :BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:  cubit.validatorOfName,
                          textAlign: TextAlign.start,
                          controller: cubit.nameController,
                        ),
                        SizedBox(height: 10.h,),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            backgroundColor: AppColor.purplecolor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder:OutlineInputBorder(
                              borderSide :BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: 'Enter  Number',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Number',
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:  cubit.validatorOfNumber,
                          textAlign: TextAlign.start,
                          controller: cubit.numberController,
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onTap: (){
                          cubit.AddDesc();
                        },
                        text: 'Add',
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        text: 'Cancel',

                      ),
                    ),
                  ],
                );
              },
              listener:  (context, state) {
                var cubit = DescCubit.get(context);
                if (state is AddSuccessState){
                  cubit.nameController.clear();
                  cubit.numberController.clear();
                  Navigator.pop(context);
                }
              },
            );
          },
        );

      },
       text: 'Add New Emergency',
    );
  }
}
