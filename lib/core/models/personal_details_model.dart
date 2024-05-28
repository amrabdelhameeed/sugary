class PersonalDetailsModel {
  bool isMale;
  num weight;
  num age;
  num height;

  PersonalDetailsModel({
    required this.isMale,
    required this.weight,
    required this.age,
    required this.height,
  });

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonalDetailsModel(
      isMale: json['isMale'] as bool,
      weight: json['weight'] as num,
      age: json['age'] as num,
      height: json['height'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isMale': isMale,
      'weight': weight,
      'age': age,
      'height': height,
    };
  }
}
