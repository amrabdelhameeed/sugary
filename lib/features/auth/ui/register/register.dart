import 'dart:math';

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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    nameController = TextEditingController(text: "amr");
    emailController = TextEditingController(text: "amr${Random().nextInt(48484)}@gmail.com");
    passwordController = TextEditingController(text: "123456768");
    confirmPasswordController = TextEditingController(text: "123456768");
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                height: 80.h,
              ),
              Text(
                "Join Us",
                style: TextStyle(
                  color: AppColors.redaccentcolor,
                  fontSize: 35.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12),
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
                            const SizedBox(
                              height: 8,
                            ),
                            DefaultTextFormField(
                              hint: "Name",
                              controller: nameController,
                              validator: (p0) {
                                return AppValidators.validatorOfName(p0);
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DefaultTextFormField(
                              hint: "Email",
                              controller: emailController,
                              validator: (p0) {
                                return AppValidators.validatorOfEmail(p0);
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DefaultTextFormField(
                              controller: passwordController,
                              hint: "Password",
                              isPassword: true,
                              validator: (p0) {
                                return AppValidators.validatorOfPass(p0);
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DefaultTextFormField(
                              controller: confirmPasswordController,
                              hint: "Confirm Password",
                              isPassword: true,
                              validator: (p0) {
                                return AppValidators.validatorOfConfirmPass(p0, passwordController.text);
                              },
                            ),
                            SizedBox(
                              height: 8.h,
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
                                  if (state is UpdateDisplayName) {
                                    context.goNamed(AppRoutes.questions);
                                  }
                                },
                                builder: (context, state) {
                                  if (state is AuthLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator.adaptive(),
                                    );
                                  } else {
                                    return CustomButton(
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          await authCubit.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                                          authCubit.updateDisplayName(name: nameController.text);
                                          // Move.moveAndReplace(context, PersonDetail());
                                        }
                                      },
                                      text: '  Register  ',
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Already have account ?",
                                  style: TextStyle(
                                    color: AppColors.redaccentcolor,
                                    // fontSize: 20.sp,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      context.pushReplacementNamed(AppRoutes.signIn);
                                    },
                                    child: const Text("Sign In"))
                              ],
                            ),
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
