import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LOC Home Workout",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}