import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/1screens/loginscreens/screens/login.dart';

import '../../../../model/color/dart color.dart';
import '../../../../model/custombutton/custombutton.dart';
import '../../../../model/move/Navigation.dart';
import '../../../detailscreens3/first/persondetails.dart';
import '../signupcubit/auth_cubit.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80.h,),
              Text(
                "Join Us",
                style: TextStyle(
                  color: AppColor.redaccentcolor,
                  fontSize: 35.sp,
                ),
              ),

              SizedBox(height: 15.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BlocProvider(
                    create: (context) => AuthCubit(),
                    child:  Form(
                      key: AuthCubit.get(context).formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 8,),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder:OutlineInputBorder(
                                  borderSide :BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.pinkcolor,
                                  ),
                                ),
                                hintText: 'please , Enter Your Name',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),

                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: AuthCubit.get(context).validatorOfName,
                              textAlign: TextAlign.start,
                              controller: AuthCubit.get(context).nameController,
                            ),

                            SizedBox(height: 8,),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder:OutlineInputBorder(
                                  borderSide :BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.pinkcolor,
                                  ),
                                ),
                                hintText: 'please , Enter Your Email',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),

                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: AuthCubit.get(context).validatorOfEmail,
                              textAlign: TextAlign.start,
                              controller: AuthCubit.get(context).emailController,
                            ),

                            SizedBox(height: 8,),

                            TextFormField(
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder:OutlineInputBorder(
                                  borderSide :BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.pinkcolor,
                                  ),
                                ),
                                hintText: 'please , Enter Your Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    AuthCubit.get(context).Obscure();
                                  },
                                  icon: Icon (AuthCubit.get(context).obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    color: AuthCubit.get(context).obscure ?  Colors.green : Colors.grey,
                                  ),
                                ),
                              ),
                              obscureText: AuthCubit.get(context).obscure,
                              obscuringCharacter: '*',
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: AuthCubit.get(context).validatorOfPass,


                              textAlign: TextAlign.start,

                              controller: AuthCubit.get(context).passwordController,
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder:OutlineInputBorder(
                                  borderSide :BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.pinkcolor,
                                  ),
                                ),
                                hintText: 'please , Enter Your Confirm Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Colors.black,
                                ),

                              ),
                              obscureText: AuthCubit.get(context).obscure,
                              obscuringCharacter: '*',
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: AuthCubit.get(context).validatorOfConfirmPass,


                              textAlign: TextAlign.start,

                              controller: AuthCubit.get(context).confirmpassController,
                            ),
                            SizedBox(height: 8.h,),
                            SizedBox(height: 40.h,),
                            Center(
                              child: CustomButton(

                                onTap: (){
                                  if(AuthCubit.get(context).formKey.currentState!.validate())
                                    Move.moveAndReplace(context,PersonDetail());

                                },
                                text: '  Register  ',

                              ),
                            ),
                            SizedBox(height: 8.h,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
