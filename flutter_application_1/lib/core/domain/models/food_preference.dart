class FoodPreferences {
  final Map<String, dynamic> food_like;

  FoodPreferences({
    required this.food_like,
  });

  factory FoodPreferences.fromJson(Map<String, dynamic> json) {
    return FoodPreferences(
      food_like: json['food_like'] != null && json['food_like'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['food_like'])
          : {},
    );
  }
}
