import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'package:loc_home_workout_app/bloc/RandomMode.dart';
import 'package:loc_home_workout_app/screens/StartWorkout.dart';

class RandomModeScreen extends StatefulWidget {
  @override
  _RandomModeScreenState createState() => _RandomModeScreenState();
}

class _RandomModeScreenState extends State<RandomModeScreen> {

  RandomBloc _randomBloc = RandomBloc();

  List<Exercise> workoutlist = [];

  GlobalKey<FormState>_exercisekey = new GlobalKey();

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

  @override
  void dispose() {
    super.dispose();
    _randomBloc.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0,),
              Text(
                'Random Mode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              
              SizedBox(height: 30.0,),

              StreamBuilder<List<Exercise>>(
                stream: _randomBloc.exerciseListStream,
                builder: (BuildContext context,AsyncSnapshot<List<Exercise>> snapshot){
                  
                  return Column(
                    children: <Widget>[
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                            elevation: 5.0,
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
                                    _randomBloc.exerciseNoOfSetDecrement.add(snapshot.data[index]);
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
                                    _randomBloc.exerciseNoOfSetIncrement.add(snapshot.data[index]);
                                  }
                                ),

                              ],
                            ),
                          );
                        }
                      ),
                      
                      SizedBox(
                        height: 40.0,
                      ),

                      Form(
                        key: _exercisekey,
                        child: Center(
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
                                    "Ready for\nWorkout",
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
                              navigateToStartExercisePage(snapshot.data);
                            },
                          )
                        ),
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