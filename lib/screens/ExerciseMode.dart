import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/screens/DayWiseModeScreen.dart';
import 'package:loc_home_workout_app/screens/RandomModeScreen.dart';

class ExerciseMode extends StatefulWidget {

  final bool isRandom;
  ExerciseMode({Key key, @required this.isRandom}):super(key:key);

  @override
  _ExerciseModeState createState() => _ExerciseModeState(isRandom);
}

class _ExerciseModeState extends State<ExerciseMode> {

  bool isRandom;

  _ExerciseModeState(this.isRandom);


  @override
  Widget build(BuildContext context) {
    // widget.modeName
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/images/LCO_WORKOUT_LOGO_transparent.png'),
          height: 30.0,
          width: 30.0,
        ),
        centerTitle: true,
        title: Text(
          'LOC Home Workout',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.blue,
                  Colors.purple,
            ])          
         ),        
        ),        
      ),
      body:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.blue,
                  Colors.purple,
            ]
          ) 
        ),
        child: Card(
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(100.0))),
              color: Colors.lightBlue[50],
          child: isRandom ? RandomModeScreen() : DayWiseModeScreen()
        )
      ),
    );
  }
}