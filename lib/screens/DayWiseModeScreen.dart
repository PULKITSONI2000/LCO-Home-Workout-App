import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/bloc/DayWiseMode.dart';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'package:loc_home_workout_app/screens/HomePage.dart';
import 'package:loc_home_workout_app/screens/StartWorkout.dart';

class DayWiseModeScreen extends StatefulWidget {
  @override
  _DayWiseModeScreenState createState() => _DayWiseModeScreenState();
}

class _DayWiseModeScreenState extends State<DayWiseModeScreen> {

  final DaywiseBloc _daywiseBloc = DaywiseBloc();

  @override
  void dispose() {
    super.dispose();
    _daywiseBloc.dispose();
  }

  navigateToStartExercisePage(List<Exercise> snapshotData){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>StartWorkout(
            snapshotData:snapshotData,
          )
        ),
      );
    }

  navigateToHomePage(){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>HomePage()
        ),
      );
    }
  
  

  @override
  Widget build(BuildContext context) {
        DateTime date = DateTime.now();

    return Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                date.weekday == 7 ? "It's Sunday" :'DayWise Mode',
                
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0,),

              StreamBuilder<List<Exercise>>(
                stream: _daywiseBloc.daywiseExerciseListStream,
                builder: (BuildContext context,AsyncSnapshot<List<Exercise>> snapshot){
                  
                  return Column(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image(
                                  image: AssetImage(snapshot.data[index].exerciseImage),
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.contain, 
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      snapshot.data[index].exerciseName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10.0,),

                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: (){
                                    _daywiseBloc.datwiseExerciseNoOfSetDecrement.add(snapshot.data[index]);
                                  }
                                ),

                                Text(
                                  '${snapshot.data[index].noOfSet}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.purple,
                                  ),
                                ),

                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: (){
                                    _daywiseBloc.daywiseExerciseNoOfSetIncrement.add(snapshot.data[index]);
                                  }
                                ),

                              ],
                            ),
                          );
                        }
                      ),

                      date.weekday == 7 ? Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Sunday is Relax day. If you wanted to exercise go to Random Mode or come back next day",
                          style: TextStyle(
                            fontSize: 25.0,  
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ) : Text(''),
                      SizedBox(
                        height: 40.0,
                      ),

                      Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 200.0, minHeight: 90.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    date.weekday == 7 ? 'Go to homePage' :"Ready for\nWorkout",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                          onPressed: (){
                            date.weekday == 7 ? navigateToHomePage() :navigateToStartExercisePage(snapshot.data);
                          },
                        )
                      ),
                    ],
                  );
                }
              ),
            ],
          ),
      );
  }
}