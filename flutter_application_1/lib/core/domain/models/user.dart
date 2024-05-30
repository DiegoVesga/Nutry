import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/core/domain/models/food_preference.dart';

class User {
  final int user_id;
  final String nombre;
  final String correo;
  final String password;
  final String birthdate;
  final String gender;
  final int weight;
  final int height;
  final String medical_condition;
  final Map<String, FoodPreferences> food_preferences;

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
    var foodPreferencesMap = json['food_preferences'] as Map<String, dynamic>;
    var foodPreferences = foodPreferencesMap.map((key, value) {
      return MapEntry(key, FoodPreferences.fromJson(value));
    });
    return User(
      user_id: json['user_id'],
      nombre: json['nombre'],
      correo: json['correo'],
      password: json['password'],
      birthdate: json['birthdate'],
      gender: json['gender'],
      weight: json['weight'],
      height: json['height'],
      food_preferences: foodPreferences,
      medical_condition: json['medical_condition'],
    );
  }
}
