import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/core/constants/app_colors.dart';

class AppTheme {
  static textStyleFontFamilyBasedOnLocale(locale) => TextStyle(
        fontFamily: locale == 'en' ? "inria" : "inria",
      );
  static ThemeData lightTheme(String locale) => ThemeData(
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        primaryColor: AppColors.appColorDarkMode,
        iconTheme: IconThemeData(color: Colors.grey[900]),
        scaffoldBackgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        primaryColorDark: AppColors.greyMid,
        primaryColorLight: Color.fromRGBO(230, 230, 230, 1),
        secondaryHeaderColor: Colors.grey[600],
        shadowColor: Colors.grey[200],
        textTheme: TextTheme(
            bodyMedium: textStyleFontFamilyBasedOnLocale(locale),
            bodySmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displayLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displayMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displaySmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            bodyLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            )),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          unselectedLabelStyle: TextStyle(
            fontFamily: locale == 'en' ? "inria" : "inria",
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(227, 202, 224, 1)),
        appBarTheme: AppBarTheme(
          // toolbarHeight: 30.h,
          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          color: Colors.white,
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.grey[900],
          ),
          actionsIconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      );

  static ThemeData darkTheme(String locale) => ThemeData(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            bodySmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displayLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displayMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            displaySmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            titleMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelMedium: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            headlineSmall: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            labelLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            ),
            bodyLarge: TextStyle(
              fontFamily: locale == 'en' ? "inria" : "inria",
            )),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.greyDark),
        primaryColor: AppColors.appColorDarkMode,
        iconTheme: IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: AppColors.greyDark,
        highlightColor: Colors.black,
        primaryColorLight: Color.fromRGBO(42, 49, 57, 1),
        brightness: Brightness.dark,
        cardColor: Color.fromRGBO(30, 37, 43, 1),
        primaryColorDark: Colors.grey[300],
        secondaryHeaderColor: Colors.grey[400],
        shadowColor: Color(0xff282828),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: locale == 'en' ? "inria" : "inria",
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontFamily: locale == 'en' ? "inria" : "inria",
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(42, 49, 57, 1)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          color: AppColors.greyDark,
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
      );
}
