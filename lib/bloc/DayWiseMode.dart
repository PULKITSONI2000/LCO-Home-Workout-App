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
          Exercise(1,'Jumping Jacks',60,'assets/images/Jumping_Jacks.gif',3,),
          Exercise(2,'Incline Push-Ups',50,'assets/images/Incline_Push-Ups.gif',3,),
          Exercise(3,'Push-Ups',40,'assets/images/Push-Ups.gif',3,),
          Exercise(4,'Wide Arm Push-Ups',40,'assets/images/Wide_Arm_Push-Ups.gif',3,),
          Exercise(5,'Decline Push-Up',40,'assets/images/Decline_Push-Up.gif',3,),
        ]);
        
        break;
      case 2:

        _daywiseExerciseList.addAll([

          Exercise(1,'Band Bent-Over Row',40,'assets/images/Band_Bent-Over_Row.gif',3,),
          Exercise(2,'Renegade Row',50,'assets/images/Renegade_Row.gif',3,),
          Exercise(3,'Dumbbell Single Arm Row',30,'assets/images/Dumbbell_Single_Arm_Row.gif',3,),
          Exercise(4,'Inverted Row',60,'assets/images/Inverted_Row.gif',3,),
          Exercise(5,'Seated Cable Row',60,'assets/images/Seated_Cable_Row.gif',3,),

        ]);
        
        break;
      case 3:

        _daywiseExerciseList.addAll([

          Exercise(1,'Plank raise tap crunch',40,'assets/images/Plank_raise_tap_crunch.gif',3,),
          Exercise(2,'Dumbbell lateral raise',40,'assets/images/Dumbbell_lateral_raise.gif',3,),
          Exercise(3,'Reverse fly',40,'assets/images/Reverse_fly.gif',3,),
          Exercise(4,'Military press',60,'assets/images/Military_press.gif',3,),
          Exercise(5,'Arnold press',60,'assets/images/Arnold_press.gif',3,),

        ]);
        
        break;
      case 4:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Standing Barbell Curl',40,'assets/images/Standing_Barbell_Curl.gif',3,),
          Exercise(2,'Concentration Curl',40,'assets/images/Concentration_Curl.gif',3,),
          Exercise(3,'Hammer Curl',40,'assets/images/Hammer_Curl.gif',3,),
          Exercise(4,'Narrow Push Ups',60,'assets/images/Narrow_Push_Ups.gif',3,),
          Exercise(5,'Bench Dip',60,'assets/images/Bench_Dip.gif',3,),

        ]);

        break;
      case 5:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Plank',40,'assets/images/Plank.jpg',3,),
          Exercise(2,'Mountain Climber',60,'assets/images/Mountain_Climber.gif',3,),
          Exercise(3,'Crunches',40,'assets/images/Crunches.gif',3,),
          Exercise(4,'Bicycle Crunches',60,'assets/images/Bicycle_Crunches.gif',3,),
          Exercise(5,'V-Ups',60,'assets/images/V-Ups.gif',3,),

        ]);

        break;
      case 6:
        
        _daywiseExerciseList.addAll([

          Exercise(1,'Squats',40,'assets/images/Squats.gif',3,),
          Exercise(2,'Dumbbell Step Up',60,'assets/images/Dumbbell_Step_Up.gif',3,),
          Exercise(3,'Front Squat',40,'assets/images/Front_Squat.gif',3,),
          Exercise(4,'Walking Lunge',60,'assets/images/Walking_Lunge.gif',3,),
          Exercise(5,'Bodyweight Calf Raise',60,'assets/images/Bodyweight_Calf_Raise.gif',3,),

        ]);

        break;
      case 7:
        
        // _daywiseExerciseList.addAll([

        //   Exercise(1,'Relax its sunday',20,'assets/images/LOC_WORKOUT_LOGO.gif',1,),

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