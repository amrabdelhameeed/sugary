import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sugar/app_router.dart';
import 'package:sugar/core/constants/app_assets.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/database_provider/app_services_database_provider.dart';
import 'package:sugar/core/network/api_services.dart';
import 'package:sugar/core/utils/dio_helper.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    if (![1, 2].contains(index)) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 55.h,
      ),
      bottomNavigationBar: _bottomNavBar(context),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: widget.navigationShell,
          ),
        ],
      ),
    );
  }

  StatefulBuilder _bottomNavBar(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setStateBottomNavBar) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: AppColors.appColor,
            ),
            BottomNavigationBar(
                selectedItemColor: (AppServicesDBprovider.isDark()) ? Colors.white : AppColors.purple,
                selectedFontSize: 10.sp,
                unselectedFontSize: 9.sp,
                backgroundColor: Colors.white,
                // iconSize: 25.h,
                unselectedItemColor: AppServicesDBprovider.isDark() ? Colors.grey : Theme.of(context).primaryColor,
                unselectedIconTheme: IconThemeData(
                  color: AppServicesDBprovider.isDark() ? Colors.grey : Theme.of(context).primaryColor,
                ),
                unselectedLabelStyle: TextStyle(color: AppServicesDBprovider.isDark() ? Colors.grey : Theme.of(context).primaryColor, fontWeight: FontWeight.w500),
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
                currentIndex: selectedIndex,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (value) {
                  // Camera
                  if (value == 1) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: AppPadding.mainPadding,
                          height: 0.5.sh,
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Add Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () async {
                                  // Pick the image from the camera
                                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, preferredCameraDevice: CameraDevice.rear);

                                  if (pickedFile != null) {
                                    // Read the file as bytes
                                    final bytes = await pickedFile.readAsBytes();
                                    // Encode the file as a base64 string
                                    final String base64Image = base64Encode(bytes);

                                    // Use Dio to send the base64 string to your server
                                    await ApiServices.fetchEyeModel(base64Image).then((response) {
                                      // Handle the response from the server
                                      print("Image uploaded!");
                                      print(response.data.toString());

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog.adaptive(
                                            content: Text(response.data["prediction"] == "No_DR" ? "You are fine ☺" : "You have to go to the doctor now  😔"),
                                          );
                                        },
                                      );
                                    }).catchError((error) {
                                      // Handle any errors
                                      print("Failed to upload image: $error");
                                    });
                                  } else {
                                    print("No image selected.");
                                  }
                                },
                                child: Container(
                                  // margin: AppPadding.bigPadding,
                                  // padding: AppPadding.mainPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          Assets.assetsAppEye,
                                          // width: 50.w,
                                        ),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Text(
                                        "Eye",
                                        style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () async {
                                  // await ImagePicker().pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
                                  // Pick the image from the camera
                                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, preferredCameraDevice: CameraDevice.rear);

                                  if (pickedFile != null) {
                                    // Read the file as bytes
                                    final bytes = await pickedFile.readAsBytes();
                                    // Encode the file as a base64 string
                                    final String base64Image = base64Encode(bytes);

                                    // Use Dio to send the base64 string to your server
                                    await ApiServices.fetchFoodModel(base64Image).then((response) {
                                      // Handle the response from the server
                                      print("Image uploaded!");
                                      print(response.data.toString());

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog.adaptive(
                                            content: Text(response.data["calorie_info"].toString()),
                                          );
                                        },
                                      );
                                    }).catchError((error) {
                                      // Handle any errors
                                      print("Failed to upload image: $error");
                                    });
                                  } else {
                                    print("No image selected.");
                                  }
                                },
                                child: Container(
                                  // margin: AppPadding.bigPadding,
                                  // padding: AppPadding.mainPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          Assets.assetsAppFood2,
                                          // width: 50.w,
                                        ),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Text(
                                        "Food",
                                        style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  // Plus
                  else if (value == 2) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: AppPadding.mainPadding,
                          height: 0.6.sh,
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Add Entry",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  AppRouter.router.goNamed(AppRoutes.myFolderGlucose);
                                },
                                child: Container(
                                  // margin: AppPadding.bigPadding,
                                  // padding: AppPadding.mainPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          Assets.assetsAppDiabetes,
                                          // width: 50.w,
                                        ),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Text(
                                        "Glucose Reading",
                                        style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  AppRouter.router.goNamed(AppRoutes.myFolderCumulative);
                                },
                                child: Container(
                                  // margin: AppPadding.bigPadding,
                                  // padding: AppPadding.mainPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          Assets.assetsAppSyringe,
                                          // width: 50.w,
                                        ),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Text(
                                        "Insulin",
                                        style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  AppRouter.router.goNamed(AppRoutes.medicationReminder);
                                },
                                child: Container(
                                  // margin: AppPadding.bigPadding,
                                  // padding: AppPadding.mainPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                          Assets.assetsAppMedication,
                                          // width: 50.w,
                                        ),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Text(
                                        "Medication",
                                        style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    _goBranch(value);
                    setStateBottomNavBar(() {
                      selectedIndex = value;
                    });
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        Assets.assetsAppHome,
                        height: 30.h,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.assetsAppCam, height: 30.h),
                    label: "Camera",
                  ),
                  BottomNavigationBarItem(icon: Image.asset(Assets.assetsAppAddButton, height: 35.h), label: "Add"),
                  BottomNavigationBarItem(icon: Image.asset(Assets.assetsAppSettings, height: 30.h), label: "Settings"),
                  BottomNavigationBarItem(icon: Image.asset(Assets.assetsAppProfile, height: 30.h), label: "Profile"),
                ])
          ],
        );
      },
    );
  }
}
