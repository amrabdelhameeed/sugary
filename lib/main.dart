import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/1screens/first.dart';
import 'package:sugar/view/1screens/loginscreens/logincubit/login_cubit.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:sugar/view/detailscreens3/first/Cubit/cubit.dart';
import 'package:sugar/view/detailscreens3/first/Cubit/observer.dart';
import 'package:sugar/view/homescreen/cubit/addnewemergency/DescCubit.dart';
import 'package:sugar/view/homescreen/cubit/home_cubit.dart';
import 'package:sugar/view/homescreen/cubit/profilecubit/profile_cubit.dart';
import 'package:sugar/view/homescreen/screens/HomeScreen2.dart';
import 'package:sugar/view/homescreen/screens/bottom.dart';
import 'package:sugar/view/homescreen/screens/homescreen.dart';
import 'package:sugar/view/homescreen/screens/profile.dart';
import 'package:sugar/view/ques/cubit/ques_cubit.dart';
import 'package:sugar/view/ques/question.dart';

// ...

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocObserver observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(
      MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit(),),
            BlocProvider(create: (context) => LoginCubit(),),
            BlocProvider(create: (context) => BMICupit(),),
            BlocProvider(create: (context) => QuesCubit(),),
            BlocProvider(create: (context) => HomeCubit(),),

            BlocProvider(create: (context) => DescCubit(),),
            BlocProvider(create: (context) => ProfileCubit(),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sugary',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

            ),
            home: child,
          ),
        );
      },
      child:  HomeScreen(),
    );
  }
}