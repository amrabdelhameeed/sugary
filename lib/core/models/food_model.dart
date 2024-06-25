class FoodModel {
  final List<String> calorieInfo;
  final double insulinDose;
  final double totalCalories;

  FoodModel({
    required this.calorieInfo,
    required this.insulinDose,
    required this.totalCalories,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      calorieInfo: List<String>.from(json['calorie_info']),
      insulinDose: json['insulin_dose'].toDouble(),
      totalCalories: json['total_calories'].toDouble(),
    );
  }
}
