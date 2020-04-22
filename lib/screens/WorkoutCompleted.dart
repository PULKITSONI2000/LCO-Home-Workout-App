import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'package:share/share.dart';

class WorkoutCompleted extends StatefulWidget {

  final List<Exercise> snapshotData;
  WorkoutCompleted({Key exercisekey, @required this.snapshotData }):super(key:exercisekey);

  @override
  _WorkoutCompletedState createState() => _WorkoutCompletedState(snapshotData);
}

class _WorkoutCompletedState extends State<WorkoutCompleted> {
  
  List<Exercise> snapshotData;
  _WorkoutCompletedState(this.snapshotData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/images/LCO WORKOUT LOGO transparent copy.png'),
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
                  children: <Widget>[

                    Text(
                      'welldone',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'You Completed the Exercise',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),

                    ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: snapshotData.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                            // margin: EdgeInsets.only(top: 10.0),
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
                                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 80.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                                onPressed:(){
                                  share(context,snapshotData);
                                } 
                              ),
                  ],
                ),
              )
        )
      )
    );
  }
  void share(BuildContext context, List<Exercise> snapshotDate){
    String text = '''
Hey checkout I Completed my today's Workout\n
${snapshotData[0].exerciseName} X ${snapshotData[0].noOfSet}
${snapshotData[1].exerciseName} X ${snapshotData[1].noOfSet}
${snapshotData[2].exerciseName} X ${snapshotData[2].noOfSet}
${snapshotData[3].exerciseName} X ${snapshotData[3].noOfSet}
${snapshotData[4].exerciseName} X ${snapshotData[4].noOfSet}
    ''';
    String subject = "LOC Home Workout";

    final RenderBox box = context.findRenderObject();
    Share.share(text, subject: subject, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}