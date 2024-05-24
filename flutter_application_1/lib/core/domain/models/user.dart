import 'package:flutter_application_1/core/domain/models/food_preference.dart';
import 'package:flutter_application_1/core/domain/models/medical_condition.dart';

class User {
  final int user_id;
  final String nombre;
  final String correo;
  final String password;
  final String birthdate;
  final String gender;
  final int weight;
  final int height;
  final List<MedicalCondition> medical_condition;
  final List<FoodPreferences> food_preferences;

  User(
      {required this.user_id,
      required this.nombre,
      required this.correo,
      required this.password,
      required this.birthdate,
      required this.gender,
      required this.weight,
      required this.height,
      required this.medical_condition,
      required this.food_preferences});

  factory User.fromJson(Map<String, dynamic> json) {
    var medicalCondition = json['medical_condition'] as List;
    List<MedicalCondition> medical_condition = medicalCondition
        .map((item) => MedicalCondition.fromJson(item))
        .toList();
    var foodPreferences = json['food_preferences'] as List;
    List<FoodPreferences> food_preferences =
        foodPreferences.map((item) => FoodPreferences.fromJson(item)).toList();
    return User(
      user_id: json['user_id'],
      nombre: json['nombre'],
      correo: json['correo'],
      password: json['password'],
      birthdate: json['birthdate'],
      gender: json['gender'],
      weight: json['weight'],
      height: json['height'],
      food_preferences: food_preferences,
      medical_condition: medical_condition,
    );
  }
}
