import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/database_provider/glucose_db_provider.dart';
import 'package:sugar/core/models/meal_model.dart';
import 'package:sugar/core/network/api_services.dart';
import 'package:sugar/core/utils/dio_helper.dart';

class MealPlanningScreen extends StatefulWidget {
  const MealPlanningScreen({super.key});

  @override
  State<MealPlanningScreen> createState() => _MealPlanningScreenState();
}

class _MealPlanningScreenState extends State<MealPlanningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Planning"),
      ),
      body: FutureBuilder(
        future: ApiServices.fetchSugarModel((GlucoseDBprovider.box.isNotEmpty ? GlucoseDBprovider.box.values.last.read : 0)!.toDouble()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            final list = MealData.fromJson(snapshot.data!.data);
            return ListView.separated(
                padding: EdgeInsets.all(5.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.meal, extra: list.meals[index]);
                    },
                    child: Card(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                          ),
                          child: Text(
                            list.meals[index].meal,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.transparent,
                  );
                },
                itemCount: list.meals.length);
          }
        },
      ),
    );
  }
}
