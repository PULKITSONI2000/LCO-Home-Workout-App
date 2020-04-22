import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'dart:async';


class DaywiseBloc {

  List<Exercise> _daywiseExerciseList = [];

  //                          bloc part

  final _daywiseExerciseListStreamController = StreamController<List<Exercise>>();

  final _daywiseExerciseNoOfSetIncrementStreamController = StreamController<Exercise>();
  
  final _daywiseExerciseNoOfSetDecrementStreamController = StreamController<Exercise>();


  //getters
  Stream<List<Exercise>> get daywiseExerciseListStream => _daywiseExerciseListStreamController.stream;

  StreamSink<List<Exercise>> get daywiseExerciseListSink => _daywiseExerciseListStreamController.sink;

  StreamSink<Exercise> get daywiseExerciseNoOfSetIncrement => _daywiseExerciseNoOfSetIncrementStreamController.sink;
  
  StreamSink<Exercise> get datwiseExerciseNoOfSetDecrement => _daywiseExerciseNoOfSetDecrementStreamController.sink;
  


  // constructor
  DaywiseBloc(){
    
    DateTime date = DateTime.now();

    switch (date.weekday) {
      case 1:

        _daywiseExerciseList.addAll([
          Exercise(1,'Jumping Jacks',60,'assets/images/Jumping Jacks.gif',3,),
          Exercise(2,'Incline Push-Ups',50,'assets/images/Incline Push-Ups.gif',3,),
          Exercise(3,'Push-Ups',40,'assets/images/Push-Ups.gif',3,),
          Exercise(4,'Wide Arm Push-Ups',40,'assets/images/Wide Arm Push-Ups.gif',3,),
          Exercise(5,'Decline Push-Up',40,'assets/images/Decline Push-Up.gif',3,),
        ]);
        
        break;
      case 2:

        _daywiseExerciseList.addAll([

          Exercise(1,'Band Bent-Over Row',40,'assets/images/Band Bent-Over Row.gif',3,),
          Exercise(2,'Renegade Row',50,'assets/images/Renegade Row.gif',3,),
          Exercise(3,'Dumbbell Single Arm Row',30,'assets/images/Dumbbell Single Arm Row.gif',3,),
          Exercise(4,'Inverted Row',60,'assets/images/Inverted Row.gif',3,),
          Exercise(5,'Seated Cable Row',60,'assets/images/Seated Cable Row.gif',3,),

        ]);
        
        break;
      case 3:

        _daywiseExerciseList.addAll([

          Exercise(1,'Plank raise tap crunch',40,'assets/images/Plank raise tap crunch.gif',3,),
          Exercise(2,'Dumbbell lateral raise',40,'assets/images/Dumbbell lateral raise.gif',3,),
          Exercise(3,'Reverse fly',40,'assets/images/Reverse fly.gif',3,),
          Exercise(4,'Military press',60,'assets/images/Military press.gif',3,),
          Exercise(5,'Arnold press',60,'assets/images/Arnold press.gif',3,),

        ]);
        
        break;
      case 4:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Standing Barbell Curl',40,'assets/images/Standing Barbell Curl.gif',3,),
          Exercise(2,'Concentration Curl',40,'assets/images/Concentration Curl.gif',3,),
          Exercise(3,'Hammer Curl',40,'assets/images/Hammer Curl.gif',3,),
          Exercise(4,'Narrow Push Ups',60,'assets/images/Narrow Push Ups.gif',3,),
          Exercise(5,'Bench Dip',60,'assets/images/Bench Dip.gif',3,),

        ]);

        break;
      case 5:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Plank',40,'assets/images/Plank.jpg',3,),
          Exercise(2,'Mountain Climber',60,'assets/images/Mountain Climber.gif',3,),
          Exercise(3,'Crunches',40,'assets/images/Crunches.gif',3,),
          Exercise(4,'Bicycle Crunches',60,'assets/images/Bicycle Crunches.gif',3,),
          Exercise(5,'V-Ups',60,'assets/images/V-Ups.gif',3,),

        ]);

        break;
      case 6:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Squats',40,'assets/images/Squats.gif',3,),
          Exercise(2,'Dumbbell Step Up',60,'assets/images/Dumbbell Step Up.gif',3,),
          Exercise(3,'Front Squat',40,'assets/images/Front Squat.gif',3,),
          Exercise(4,'Walking Lunge',60,'assets/images/Walking Lunge.gif',3,),
          Exercise(5,'Bodyweight Calf Raise',60,'assets/images/Bodyweight Calf Raise.gif',3,),

        ]);

        break;
      case 7:
        
        // _daywiseExerciseList.addAll([

        //   Exercise(1,'Relax its sunday',20,'assets/images/Squats.gif',1,),

        // ]);

        break;
    }
    
    
    _daywiseExerciseListStreamController.add(_daywiseExerciseList);

    _daywiseExerciseNoOfSetIncrementStreamController.stream.listen(_daywiseExerciseNoOfSetIncrementer);
    
    _daywiseExerciseNoOfSetDecrementStreamController.stream.listen(_daywiseExerciseNoOfSetDecrementer);


  }

  _daywiseExerciseNoOfSetIncrementer(Exercise exercise){
    int noOfSet = exercise.noOfSet;

    _daywiseExerciseList[exercise.exerciseId - 1].noOfSet = noOfSet + 1 ;

    daywiseExerciseListSink.add(_daywiseExerciseList);
  }
  
  _daywiseExerciseNoOfSetDecrementer(Exercise exercise){
    int noOfSet = exercise.noOfSet;

    if (noOfSet > 1) {
      _daywiseExerciseList[exercise.exerciseId - 1].noOfSet = noOfSet - 1 ;
    } 

    daywiseExerciseListSink.add(_daywiseExerciseList);
  }


  void dispose(){
    _daywiseExerciseListStreamController.close();
    _daywiseExerciseNoOfSetIncrementStreamController.close();
    _daywiseExerciseNoOfSetDecrementStreamController.close();
  }
}