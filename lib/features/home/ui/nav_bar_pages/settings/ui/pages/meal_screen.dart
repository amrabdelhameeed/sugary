import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/core/database_provider/glucose_db_provider.dart';
import 'package:sugar/core/models/meal_model.dart';
import 'package:sugar/core/utils/dio_helper.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/widgets/nutrition_widget.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key, required this.meal});
  final Meal meal;
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.meal.meal} Foods"),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(5.h),
            itemBuilder: (context, index) {
              return Container(
                height: 200.h,
                child: Card(
                  child: NutritionPieChart(index: index, meal: widget.meal),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.transparent,
              );
            },
            itemCount: widget.meal.foods.length)
        // GridView.builder(
        //   padding: EdgeInsets.all(5.h),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, // Adjust the number of columns as needed
        //     childAspectRatio: 0.7, // Adjust the aspect ratio as needed
        //     crossAxisSpacing: 10, // Adjust spacing between items horizontally
        //     mainAxisSpacing: 10, // Adjust spacing between items vertically
        //   ),
        //   itemBuilder: (context, index) {
        //     return Card(
        //       child: NutritionPieChart(index: index, meal: widget.meal),
        //     );
        //   },
        //   itemCount: widget.meal.foods.length,
        // ),
        );
  }
}
