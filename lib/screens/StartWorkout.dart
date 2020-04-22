import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'package:loc_home_workout_app/screens/Workout.dart';
import 'package:loc_home_workout_app/screens/WorkoutCompleted.dart';

class StartWorkout extends StatefulWidget {
  
  final List<Exercise> snapshotData;
  StartWorkout({Key exercisekey, @required this.snapshotData }):super(key:exercisekey);

  
  @override
  _StartWorkoutState createState() => _StartWorkoutState(snapshotData);

  
}

class _StartWorkoutState extends State<StartWorkout> {

  List<Exercise> snapshotData;
  _StartWorkoutState(this.snapshotData);

  int exerciseIndex = 0;
  

  void _returnValueFromWorkoutScreen(BuildContext context, int index) async {

    // start the WorkoutScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Workout(snapshotData[index]),
        ));

    if (result < 5) {
      setState(() {
        exerciseIndex = result;
        _returnValueFromWorkoutScreen(context,exerciseIndex);
      });
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutCompleted(snapshotData: snapshotData,)));
    } 
}

  


  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(100.0))),
          color: Colors.lightBlue[50],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: snapshotData.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(snapshotData[index].exerciseImage),
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.contain, 
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      snapshotData[index].exerciseName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  'X',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Text(
                                  '${snapshotData[index].noOfSet}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0
                                  ),
                                ),
                                SizedBox(width: 20,)
                              ],
                            ),
                          );
                        }
                      ),

                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.greenAccent[700],
                  child: Text(
                    "let's Start Workout\nWith music",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  onPressed: () => _returnValueFromWorkoutScreen(context,exerciseIndex),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
