import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/database_provider/emergency_services_database_provider.dart';
import 'package:sugar/core/shared_cubits/cubit/profile_cubit.dart';
import 'package:sugar/di.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const CircularProgressIndicator.adaptive();
                } else {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL ?? "https://www.vhv.rs/dpng/d/505-5058560_person-placeholder-image-free-hd-png-download.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.pinkcolor,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                // Assuming you have a function to upload the image and get the URL
                                context.read<ProfileCubit>().updatePhotoURL(image);
                              }
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const CircularProgressIndicator.adaptive();
                } else {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: Text(
                          'Name',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (FirebaseAuth.instance.currentUser!.displayName ?? "Brother").toUpperCase(),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Logic to edit name
                                _showEditDialog(context, 'Name', FirebaseAuth.instance.currentUser!.displayName ?? "Brother", (newValue) {
                                  context.read<ProfileCubit>().updateName(newValue);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: Text(
                          'Gender',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(profileCubit.personalDetailsModel!.isMale ? "Male" : "Female"),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Logic to edit gender
                                _showEditDialog(context, 'Gender', profileCubit.personalDetailsModel!.isMale ? "Male" : "Female", (newValue) {
                                  bool isMale = newValue.toLowerCase() == 'male' || newValue.toLowerCase() == 'shubrian';
                                  context.read<ProfileCubit>().updateGender(isMale);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: Text(
                          'Age',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(profileCubit.personalDetailsModel!.age.toString()),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Logic to edit age
                                _showEditDialog(context, 'Age', profileCubit.personalDetailsModel!.age.toString(), (newValue) {
                                  int age = int.parse(newValue);
                                  context.read<ProfileCubit>().updateAge(age);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: Text(
                          'Height',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(profileCubit.personalDetailsModel!.height.toStringAsFixed(0)),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Logic to edit height
                                _showEditDialog(context, 'Height', profileCubit.personalDetailsModel!.height.toStringAsFixed(0), (newValue) {
                                  double height = double.parse(newValue);
                                  context.read<ProfileCubit>().updateHeight(height);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        leading: Text(
                          'Weight',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(profileCubit.personalDetailsModel!.weight.toStringAsFixed(0)),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Logic to edit weight
                                _showEditDialog(context, 'Weight', profileCubit.personalDetailsModel!.weight.toStringAsFixed(0), (newValue) {
                                  double weight = double.parse(newValue);
                                  context.read<ProfileCubit>().updateWeight(weight);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            Spacer(),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileSignOut) {
                  context.goNamed(AppRoutes.signIn);
                  EmergencyServicesDBprovider.deleteBox();
                }
                if (state is ProfileDeleteSuccess) {
                  context.goNamed(AppRoutes.signUp);
                  EmergencyServicesDBprovider.deleteBox();
                }
              },
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    tileColor: AppColors.appColor,
                    onTap: () {
                      profileCubit.deleteProfile();
                    },
                    leading: Text(
                      'Delete Account',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    // trailing: Icon(icon),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListTile(
                    onTap: () {
                      profileCubit.signOut();
                    },
                    tileColor: AppColors.appColor,
                    leading: Text(
                      'Sign out',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String field, String initVal, Function(String) onSave) {
    final TextEditingController controller = TextEditingController(text: initVal);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $field'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
