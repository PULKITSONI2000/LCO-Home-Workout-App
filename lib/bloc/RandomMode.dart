import 'dart:math';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'dart:async';


class RandomBloc {

  List<Exercise> _randomExerciseList = [

    Exercise(1,'Pushup',40,'assets/images/1.png',3),
    Exercise(2,'Knee Touch crunches',60, 'assets/images/2.png',3,),
    Exercise(3,'Dumble Curl',30,'assets/images/7.png',3,),
    Exercise(4,'Upper Body Streching',80,'assets/images/4.png',3,),
    Exercise(5,'Lower Body Streching',80,'assets/images/3.png',3,),
    Exercise(6,'Renegade Row',40,'assets/images/6.png',3,),
    Exercise(7,'Surya Namskar',120,'assets/images/9.png',3,),
    Exercise(8,'Incline Crunches',60,'assets/images/5.png',3,),
    Exercise(9,'Butt Exercise',40,'assets/images/8.png',3,),
    Exercise(10,'Seated Row',60,'assets/images/10.png',3,),
    Exercise(11,'Incline Bench Press',60,'assets/images/11.png',3,),
    Exercise(12,'Bench Press',60,'assets/images/12.png',3,),
    Exercise(13,'Sholder Press',40,'assets/images/13.png',3,),
    Exercise(14,'Crunches',50,'assets/images/14.png',3,),
  ];

  //                          bloc part

  final _randomExerciseListStreamController = StreamController<List<Exercise>>();

  final _randomExerciseNoOfSetIncrementStreamController = StreamController<Exercise>();
  
  final _randomExerciseNoOfSetDecrementStreamController = StreamController<Exercise>();


  //getters
  Stream<List<Exercise>> get exerciseListStream => _randomExerciseListStreamController.stream;

  StreamSink<List<Exercise>> get exerciseListSink => _randomExerciseListStreamController.sink;

  StreamSink<Exercise> get exerciseNoOfSetIncrement => _randomExerciseNoOfSetIncrementStreamController.sink;
  
  StreamSink<Exercise> get exerciseNoOfSetDecrement => _randomExerciseNoOfSetDecrementStreamController.sink;
  

  // constructor
  RandomBloc(){
    _randomExerciseListStreamController.add(_randomExerciseList);

    _randomExerciseNoOfSetIncrementStreamController.stream.listen(_randomExerciseNoOfSetIncrementer);
    
    _randomExerciseNoOfSetDecrementStreamController.stream.listen(_randomExerciseNoOfSetDecrementer);


    ////////////////
    List<Exercise> random5ExerciseList = [];
    int randomIndex = 1, maxRandomvalue = 14;

    for (var i = 0; i < 5; i++) {
      randomIndex = Random().nextInt(maxRandomvalue);  
      random5ExerciseList.add(_randomExerciseList[randomIndex]);
      _randomExerciseList.removeAt(randomIndex);
      -- maxRandomvalue;
      random5ExerciseList[i].exerciseId = i + 1; 
    }
    _randomExerciseList.clear();
    _randomExerciseList.addAll(random5ExerciseList);
    ///
  }

  _randomExerciseNoOfSetIncrementer(Exercise exercise){
    int noOfSet = exercise.noOfSet;

    _randomExerciseList[exercise.exerciseId - 1].noOfSet = noOfSet + 1 ;

    exerciseListSink.add(_randomExerciseList);
  }
  
  _randomExerciseNoOfSetDecrementer(Exercise exercise){
    int noOfSet = exercise.noOfSet;

    if (noOfSet > 1) {
      _randomExerciseList[exercise.exerciseId - 1].noOfSet = noOfSet - 1 ;
    } 

    exerciseListSink.add(_randomExerciseList);
  }



  void dispose(){
    _randomExerciseListStreamController.close();
    _randomExerciseNoOfSetIncrementStreamController.close();
    _randomExerciseNoOfSetDecrementStreamController.close();
  }
}