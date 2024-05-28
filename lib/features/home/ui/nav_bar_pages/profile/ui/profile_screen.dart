import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL ?? "https://www.vhv.rs/dpng/d/505-5058560_person-placeholder-image-free-hd-png-download.png"),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (FirebaseAuth.instance.currentUser!.displayName ?? "Brother").toUpperCase(),
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   "Handle : 3amori",
                    //   style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    // )
                  ],
                )
              ],
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
                        trailing: Text(
                          (FirebaseAuth.instance.currentUser!.displayName ?? "Brother").toUpperCase(),
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
                        trailing: Text(profileCubit.personalDetailsModel!.isMale ? "Male" : "Female"),
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
                        trailing: Text(profileCubit.personalDetailsModel!.age.toString()),
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
                        trailing: Text(profileCubit.personalDetailsModel!.height.toStringAsFixed(2)),
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
                        trailing: Text(profileCubit.personalDetailsModel!.weight.toString()),
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
}
