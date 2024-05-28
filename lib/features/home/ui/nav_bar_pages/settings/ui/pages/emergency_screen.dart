import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/database_provider/emergency_services_database_provider.dart';
import 'package:sugar/core/models/emergency_model.dart';
import 'package:sugar/core/widgets/default_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final nameController = TextEditingController();
            final phoneController = TextEditingController();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextFormField(
                        controller: nameController,
                        hint: "Add Emergency name",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      DefaultTextFormField(
                        inputType: TextInputType.number,
                        controller: phoneController,
                        hint: "Add Emergency Number",
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                            EmergencyServicesDBprovider.add(EmergencyModel(
                              nameController.text,
                              phoneController.text,
                            ));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'))
                  ],
                );
              },
            );
          },
          label: const Text("Add Emegency")),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Emergency Contacts",
              style: TextStyle(color: Colors.black, fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 10),
              child: Text(
                "Contacts you add here will be automatically contacted in case of emergency. You can delete or edit any contact by swiping them left :",
                style: TextStyle(color: Colors.grey[800], fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: EmergencyServicesDBprovider.listenable(),
              builder: (context, box, child) {
                final list = box.values.toList();
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  shrinkWrap: true,
                  itemCount: list.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onLongPress: () {
                        EmergencyServicesDBprovider.delete(list[index].key);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: const BorderSide(color: Colors.black),
                      ),
                      height: 60,
                      color: AppColors.purplecolor,
                      onPressed: () async {
                        // final pos = await _determinePosition();

                        final link = WhatsAppUnilink(
                          phoneNumber: '2${list[index].number}',
                          text:
                              "${FirebaseAuth.instance.currentUser!.displayName} is in bad condition due to diabetes , You are receiving this message because ${list[index].name} has listed you as an emergency contact.",
                        );
                        await launchUrl(Uri.parse('$link'));

                        // (${pos.longitude},${pos.latitude})
                        print(
                            "${FirebaseAuth.instance.currentUser!.displayName} is in a bad condition due to diabetes , You are receiving this message because ${list[index].name} has listed you as an emergency contact .");
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            list[index].name ?? "",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "+2${list[index].number}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )),
            SizedBox(
              height: 5.h,
            ),
            // ActionButton(),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
