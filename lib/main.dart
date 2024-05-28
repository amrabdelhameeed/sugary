import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sugar/app_router.dart';
import 'package:sugar/core/constants/app_theme.dart';
import 'package:sugar/core/constants/observer.dart';
import 'package:sugar/core/database_provider/app_services_database_provider.dart';
import 'package:sugar/core/models/cumulative_model.dart';
import 'package:sugar/core/models/emergency_model.dart';
import 'package:sugar/core/models/glucose_model.dart';
import 'package:sugar/core/models/medication_model.dart';
import 'package:sugar/core/models/sleep_model.dart';
import 'package:sugar/core/models/water_model.dart';
import 'package:sugar/core/utils/app_database_keys.dart';
import 'package:sugar/di.dart';
import 'package:sugar/features/auth/logic/auth_cubit.dart';
import 'package:sugar/features/questions/logic/ques_cubit.dart';
import 'package:sugar/firebase_options.dart';
// import 'package:sugar/view/detailscreens3/first/Cubit/cubit.dart';
// import 'package:sugar/view/homescreen/cubit/addnewemergency/DescCubit.dart';
// import 'package:sugar/view/homescreen/cubit/home_cubit.dart';
// import 'package:sugar/view/homescreen/cubit/profilecubit/profile_cubit.dart';
// import 'package:sugar/view/homescreen/screens/HomeScreen2.dart';
// import 'package:sugar/view/homescreen/screens/bottom.dart';
// import 'package:sugar/view/homescreen/screens/homescreen.dart';
// import 'package:sugar/view/homescreen/screens/profile.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/tzdata.dart' as tz;
import 'package:workmanager/workmanager.dart';
import 'core/utils/fcm_helper.dart';
import 'package:path_provider/path_provider.dart' as path;

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    NotificationHelper.show("Water Reminder", "You should drink water :)");
    return Future.value(true);
  });
}

void main() async {
  // TODO : notifications for drink water
  // TODO : db for sleep time
  // TODO : callback in case of error in auth.

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  tz.initializeTimeZones();
  await ScreenUtil.ensureScreenSize();
  await NotificationHelper.initialize();
  Workmanager().initialize(callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager().registerPeriodicTask("task-identifier", "simpleTask", frequency: const Duration(hours: 4));
  final time = DateTime.now();
  await NotificationHelper.scheduleNotificationAtSpecificTime(50, DateTime(time.year, time.month, time.day, 22, 0), "Sleep Reminder", "You should go sleep for your health.");
  await _initHiveBoxes();
  initDI();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ValueListenableBuilder(
          valueListenable: AppServicesDBprovider.listenable(),
          builder: (context, value, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: authCubit,
                ),
                // BlocProvider(
                //   create: (context) => BMICupit(),
                // ),
                BlocProvider(
                  create: (context) => QuesCubit(),
                ),
                // BlocProvider(
                //   create: (context) => HomeCubit(),
                // ),
                // BlocProvider(
                //   create: (context) => DescCubit(),
                // ),
                // BlocProvider(
                //   create: (context) => ProfileCubit(),
                // )
              ],
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'GuROW Refactored',
                themeMode: AppServicesDBprovider.isDark() ? ThemeMode.dark : ThemeMode.light,
                theme: AppServicesDBprovider.isDark() ? AppTheme.darkTheme(AppServicesDBprovider.currentLocale()) : AppTheme.lightTheme(AppServicesDBprovider.currentLocale()),
                routerConfig: AppRouter.router,
              ),
            );
          },
        );
      },
      // child: HomeScreen(),
    );
  }
}

Future<void> _initHiveBoxes() async {
  final dbPath = await path.getApplicationDocumentsDirectory();

  Hive.init(dbPath.path);
  await Hive.openBox<String>(AppDatabaseKeys.appServicesKey).then((box) {
    box.put(AppDatabaseKeys.themeKey, '0');
    // box.put(AppDatabaseKeys.themeKey, '0');

    if (box.get(AppDatabaseKeys.tokenKey) != null) {
      // _initialRoute = AppRoutes.intro;
    }
    if (!box.containsKey(AppDatabaseKeys.localeKey)) {
      //if there is not any saved locale => save device locale
      // box.put(AppDatabaseKeys.localeKey, Platform.localeName.substring(0, 2)); //"ar"-eg
      // print(Platform.localeName.substring(0, 2));
    }
    if (!box.containsKey(AppDatabaseKeys.themeKey)) {
      //if there is not any saved theme => save device theme
      final isDark = SchedulerBinding.instance.window.platformBrightness == Brightness.dark ? '1' : '0';
      box.put(AppDatabaseKeys.themeKey, isDark);
    }
  });
  Hive.registerAdapter(EmergencyModelAdapter());
  await Hive.openBox<EmergencyModel>(AppDatabaseKeys.emergencyServicesKey).then((box) {});

  Hive.registerAdapter(GlucoseModelAdapter());
  await Hive.openBox<GlucoseModel>(AppDatabaseKeys.glucoseServicesKey).then((box) {
    // box.add(GlucoseModel(DateTime.now(), Random().nextInt(4541), Random().nextInt(4541)));
  });

  Hive.registerAdapter(CumulativeModelAdapter());
  await Hive.openBox<CumulativeModel>(AppDatabaseKeys.cumulativeServicesKey).then((box) {
    // box.add(CumulativeModel(DateTime.now(), Random().nextInt(4541)));
  });

  Hive.registerAdapter(WaterModelAdapter());
  await Hive.openBox<WaterModel>(AppDatabaseKeys.waterServicesKey).then((box) {});
  Hive.registerAdapter(SleepModelAdapter());
  await Hive.openBox<SleepModel>(AppDatabaseKeys.sleepServicesKey).then((box) {});

  Hive.registerAdapter(MedicationModelAdapter());
  await Hive.openBox<MedicationModel>(AppDatabaseKeys.medicationServicesKey).then((box) {
    // if (box.isEmpty) {
    //   box.add(MedicationModel("Medication", ["sat", "mon"], ""));
    // }
  });
}
