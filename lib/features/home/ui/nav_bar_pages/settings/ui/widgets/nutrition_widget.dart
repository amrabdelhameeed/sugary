import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sugar/core/models/meal_model.dart';

class NutritionPieChart extends StatelessWidget {
  final int index;
  final Meal meal;

  NutritionPieChart({Key? key, required this.index, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 35,
                sections: showingSections(),
              ),
            )),
        Expanded(
            child: Text(
          meal.foods[index].foodName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ))
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final food = meal.foods[index];
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: food.carbohydrates,
            title: '${food.carbohydrates.toStringAsFixed(2)}g\nCarbohydrates',
            radius: 50,
            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: food.fat,
            title: '${food.fat.toStringAsFixed(2)}g\nFat',
            radius: 50,
            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            value: food.fiber,
            title: '${food.fiber.toStringAsFixed(2)}g\nFiber',
            radius: 50,
            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.yellow,
            value: food.protein,
            title: '${food.protein.toStringAsFixed(2)}g\nProtein',
            radius: 50,
            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          );
        default:
          throw Error();
      }
    });
  }
}
