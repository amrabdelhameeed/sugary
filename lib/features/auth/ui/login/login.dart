import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/constants/app_validators.dart';
import 'package:sugar/core/widgets/custom_button.dart';
import 'package:sugar/core/widgets/default_text_form_field.dart';
import 'package:sugar/di.dart';
import 'package:sugar/features/auth/logic/auth_cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController(text: "amr31436@gmail.com");
    passwordController = TextEditingController(text: "123456768");
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: AppColors.redaccentcolor,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: BlocProvider.value(
                    value: authCubit,
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ElevatedButton(
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) {
                            //           return AlertDialog(
                            //             content: Column(
                            //               mainAxisSize: MainAxisSize.min,
                            //               children: [DefaultTextFormField(hint: "Enter your glucose reading"), TextButton(onPressed: () {}, child: Text("Enter"))],
                            //             ),
                            //           );
                            //         },
                            //       );
                            //     },
                            //     child: Text("data")),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultTextFormField(
                              hint: "Email",
                              controller: emailController,
                              validator: (p0) {
                                return AppValidators.validatorOfEmail(p0);
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultTextFormField(
                              hint: "Password",
                              controller: passwordController,
                              validator: (p0) {
                                return AppValidators.validatorOfPass(p0);
                              },
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Center(
                              child: BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is AuthLoginError) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                                  }
                                  if (state is AuthLoginSuccess) {
                                    context.goNamed(AppRoutes.main);
                                  }
                                },
                                builder: (context, state) {
                                  if (state is AuthLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator.adaptive(),
                                    );
                                  } else {
                                    return CustomButton(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          authCubit.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                                          // Move.moveAndReplace(context, PersonDetail());
                                        }
                                      },
                                      text: '  Login  ',
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "New user ?",
                                  style: TextStyle(
                                    color: AppColors.redaccentcolor,
                                    // fontSize: 20.sp,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      context.pushReplacementNamed(AppRoutes.signUp);
                                    },
                                    child: const Text("Sign Up"))
                              ],
                            )
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
