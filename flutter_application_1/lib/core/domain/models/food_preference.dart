class FoodPreferences {
  final int id;
  final List food_like;
  final List food_dislike;
  final List recipe_like;
  final List recipe_dislike;

  FoodPreferences(
      {required this.id,
      required this.food_like,
      required this.food_dislike,
      required this.recipe_like,
      required this.recipe_dislike});

  factory FoodPreferences.fromJson(Map<String, dynamic> json) {
    return FoodPreferences(
        id: json['id'],
        food_like: json['food_like'],
        food_dislike: json['food_dislike'],
        recipe_like: json['recipe_like'],
        recipe_dislike: json['recipe_dislike']);
  }
}
