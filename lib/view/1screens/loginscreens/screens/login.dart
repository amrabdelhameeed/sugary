import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/model/move/Navigation.dart';
import 'package:sugar/view/1screens/loginscreens/logincubit/login_cubit.dart';

import '../../../../model/custombutton/custombutton.dart';
import '../../../../model/text/text3.dart';
import '../../../detailscreens3/first/persondetails.dart';
import 'register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 90.h,),
              Text(
                "Join Us",
                style: TextStyle(
                  color: AppColor.redaccentcolor,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: BlocProvider(
                    create: (context) => LoginCubit(),
                    child:  Form(
                      key: LoginCubit.get(context).formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 8.h,),

                            SizedBox(height: 8.h,),
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
                              validator: LoginCubit.get(context).validatorOfEmail,
                              textAlign: TextAlign.start,
                              controller: LoginCubit.get(context).emaillogController,
                            ),

                            SizedBox(height: 8.h,),

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
                                    LoginCubit.get(context).Obscure();
                                  },
                                  icon: Icon (LoginCubit.get(context).obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    color: LoginCubit.get(context).obscure ?  Colors.green : Colors.grey,
                                  ),
                                ),
                              ),
                              obscureText: LoginCubit.get(context).obscure,
                              obscuringCharacter: '*',
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: LoginCubit.get(context).validatorOfPass,


                              textAlign: TextAlign.start,

                              controller: LoginCubit.get(context).passController,
                            ),

                            SizedBox(height: 40.h,),
                            Center(
                              child: CustomButton(

                                onTap: (){
                                  if(LoginCubit.get(context).formKey.currentState!.validate())
                                    Move.moveAndReplace(context,PersonDetail());

                                },
                                text: '  Login  ',

                              ),
                            ),
                            SizedBox(height: 10.h,),
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
