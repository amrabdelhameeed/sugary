class MealData {
  List<Meal> meals;

  MealData({required this.meals});

  // Directly parse from list if the JSON is already a list
  factory MealData.fromJson(List<dynamic> jsonList) {
    List<Meal> meals = jsonList.map((i) => Meal.fromJson(i as Map<String, dynamic>)).toList();
    return MealData(meals: meals);
  }

  Map<String, dynamic> toJson() {
    return {'meals': meals.map((v) => v.toJson()).toList()};
  }
}

class Meal {
  List<Food> foods;
  String meal;

  Meal({required this.foods, required this.meal});

  factory Meal.fromJson(Map<String, dynamic> json) {
    var foodsList = json['Foods'] as List;
    List<Food> foodItems = foodsList.map((i) => Food.fromJson(i as Map<String, dynamic>)).toList();
    return Meal(foods: foodItems, meal: json['Meal'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Foods'] = foods.map((v) => v.toJson()).toList();
    data['Meal'] = meal;
    return data;
  }
}

class Food {
  double carbohydrates;
  double fat;
  double fiber;
  String foodName;
  int glycemicIndex;
  double protein;

  Food({
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    required this.foodName,
    required this.glycemicIndex,
    required this.protein,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      carbohydrates: json['Carbohydrates'] as double,
      fat: json['Fat'] as double,
      fiber: json['Fiber'] as double,
      foodName: json['Food Name'] as String,
      glycemicIndex: json['Glycemic Index'] as int,
      protein: json['Protein'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Carbohydrates'] = carbohydrates;
    data['Fat'] = fat;
    data['Fiber'] = fiber;
    data['Food Name'] = foodName;
    data['Glycemic Index'] = glycemicIndex;
    data['Protein'] = protein;
    return data;
  }
}
