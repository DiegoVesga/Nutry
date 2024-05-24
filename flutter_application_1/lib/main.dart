import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'Widgets/MyApp.dart';

List usersList = [];
bool load = false;
Map<String, dynamic> jsonDecoded = {};
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefs().initPrefs();
  try {
    String jsonString = await rootBundle.loadString('assets/data/data.json');
    jsonDecoded = json.decode(jsonString);
    usersList = jsonDecoded['usuarios'];
    load = true;
  } catch (e) {
    print(e);
  }
  runApp(MyApp());
}
