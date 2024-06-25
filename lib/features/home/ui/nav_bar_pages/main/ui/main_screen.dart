import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sugar/core/constants/app_assets.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_date_formats.dart';
import 'package:sugar/core/constants/app_padings.dart';
import 'package:sugar/core/database_provider/app_services_database_provider.dart';
import 'package:sugar/core/database_provider/cumulative_db_provider.dart';
import 'package:sugar/core/database_provider/glucose_db_provider.dart';
import 'package:sugar/core/database_provider/sleep_db_provider.dart';
import 'package:sugar/core/database_provider/water_db_provider.dart';
import 'package:sugar/core/models/question_model.dart';
import 'package:sugar/core/models/sleep_model.dart';
import 'package:sugar/core/models/water_model.dart';
import 'package:sugar/core/utils/message_helper.dart';
import 'package:sugar/core/widgets/glucose_chart_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future getTHeDoc() async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    print(doc.data()!['personalDetails']);
    print(List.from(doc.data()!['questions']).map((e) => QuestionModel.fromJson(e)).toList().first.answers);
  }

  void askForPermissions() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 22.sp,
                          ),
                        ),
                        Text(
                          (FirebaseAuth.instance.currentUser!.displayName ?? "Brother").toUpperCase(),
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: GlucoseDBprovider.listenable(),
                      builder: (context, value, child) {
                        return SizedBox(
                          height: 80.h,
                          width: 150.w,
                          child: GlucoseDBprovider.box.isNotEmpty
                              ? Image.asset(MessageHelper.getGlucoseMessageImage(GlucoseDBprovider.box.values.last.read!.toInt()))
                              : Image.asset(Assets.assetsImHomeicon),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 90.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: GlucoseDBprovider.listenable(),
                        builder: (context, value, child) {
                          return RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: GlucoseDBprovider.box.isNotEmpty ? GlucoseDBprovider.box.values.last.read.toString() : "-",
                                  style: TextStyle(fontSize: 20.sp, color: MessageHelper.getGlucoseMessageColor(GlucoseDBprovider.box.values.last.read!.toInt()), fontWeight: FontWeight.bold)),
                              const TextSpan(text: "\n"),
                              TextSpan(text: "ml/dl", style: TextStyle(fontSize: 20.sp, color: Colors.black))
                            ]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 90.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: GlucoseDBprovider.listenable(),
                            builder: (context, value, child) {
                              return Text(
                                GlucoseDBprovider.box.isNotEmpty ? MessageHelper.getGlucoseMessage(GlucoseDBprovider.box.values.last.read!.toDouble()) : "-",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.appColor, Colors.white], transform: GradientRotation(2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  DateFormat('EEEE, dd MMM yyyy').format(DateTime.now()),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900.withOpacity(0.6),
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ValueListenableBuilder(
                      valueListenable: WaterDBprovider.listenable(),
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            final item = WaterDBprovider.getItem(AppDateFormats.dateFormat.format(DateTime.now()));
                            WaterDBprovider.put(WaterModel(DateTime.now(), (item != null ? (item.read! + 1) : 1)));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.grey.shade300,
                                child: Container(
                                  padding: AppPadding.mainPadding,
                                  child: Column(
                                    children: [
                                      Expanded(child: Image.asset(Assets.assetsAppGlass)),
                                      Text(
                                        "${WaterDBprovider.getItem(
                                              AppDateFormats.dateFormat.format(DateTime.now()),
                                            ) != null ? (WaterDBprovider.getItem(
                                              AppDateFormats.dateFormat.format(DateTime.now()),
                                            )!.read! * 10).toString() + "%" : "0%"}",
                                        style: TextStyle(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "${WaterDBprovider.getItem(
                                      AppDateFormats.dateFormat.format(DateTime.now()),
                                    ) != null ? WaterDBprovider.getItem(
                                    AppDateFormats.dateFormat.format(DateTime.now()),
                                  )!.read : "0"} out of 10",
                              )
                            ],
                          ),
                        );
                      },
                    )),
                    Expanded(
                        child: ValueListenableBuilder(
                      valueListenable: SleepDBprovider.listenable(),
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            final item = SleepDBprovider.getItem(AppDateFormats.dateFormat.format(DateTime.now()));
                            SleepDBprovider.put(SleepModel(DateTime.now(), (item != null ? (item.read! + 1) : 1)));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.grey.shade300,
                                child: Container(
                                  padding: AppPadding.mainPadding,
                                  child: Column(
                                    children: [
                                      Expanded(child: Image.asset(Assets.assetsImSleepingInBed)),
                                      Text(
                                        "${SleepDBprovider.getItem(
                                              AppDateFormats.dateFormat.format(DateTime.now()),
                                            ) != null ? ((SleepDBprovider.getItem(
                                              AppDateFormats.dateFormat.format(DateTime.now()),
                                            )!.read! / 8) * 100).toStringAsFixed(0) + "%" : "0%"}",
                                        style: TextStyle(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text("${SleepDBprovider.getItem(
                                    AppDateFormats.dateFormat.format(DateTime.now()),
                                  ) != null ? SleepDBprovider.getItem(
                                  AppDateFormats.dateFormat.format(DateTime.now()),
                                )!.read : "0"} out of 8")
                            ],
                          ),
                        );
                      },
                    ))
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1000,
                    child: GlucoseChart(),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
