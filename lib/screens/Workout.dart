import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/exercise/exercise.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';


class Workout extends StatefulWidget {

  final Exercise exercise;
  Workout(this.exercise);
  @override
  _WorkoutState createState() => _WorkoutState(exercise);
}

class _WorkoutState extends State<Workout> with TickerProviderStateMixin{

  bool isWattingState = false;

  List<String> audioList = [
    'audio/50-Up_from_the_ashes.mp3',
    'audio/joined_audio.mp3',
    'audio/Song14-Rock.mp3',
    'audio/Song18-Rock.mp3',
    'audio/Song34-Pop.mp3',
  ];
  
  int countdownDuration;
  int noOfSets;
  int noOfSetsDone;
  
  Exercise exercise;
  _WorkoutState(this.exercise);

  AudioPlayer audioPlayer;
  AudioCache audioCache;
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2,'0')}";
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    countdownDuration = exercise.exerciseduration;
    noOfSets = exercise.noOfSet;
    noOfSetsDone = 1;
    randomAudio();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: countdownDuration),
    );
    controller.reverse(from: 1.0 ).orCancel;
  }

  updateAnimation(int count) {
    setState(() {
      isWattingState = !isWattingState;
      stop();
      if (!isWattingState) {
        noOfSetsDone = noOfSetsDone + 1;
        randomAudio();
      }
      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: count)
      );
      controller.reverse(from: 1.0).orCancel;
          
    });
  }

  randomAudio(){
    int randomAudioIndex = math.Random().nextInt(5);
    play(audioList[randomAudioIndex]);
  }

  play(String uri) async {
    await audioCache.loop(uri);
  }

  stop()  {
    // audioCache.clearCache();
    // audioPlayer.pause();
    audioPlayer.stop();

  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    
    ThemeData themeData = Theme.of(context);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && isWattingState == false) {
        stop();
        if (exercise.exerciseId == 5) {
          Navigator.pop(context, exercise.exerciseId);
        }
        //controller.reverse(from: 1.0);
        updateAnimation(40);

      } else if (status == AnimationStatus.dismissed && isWattingState == true && noOfSetsDone < noOfSets) {
        updateAnimation(exercise.exerciseduration);
      }
       else if (status == AnimationStatus.dismissed && isWattingState == true  && noOfSetsDone >= noOfSets) {
        Navigator.pop(context, exercise.exerciseId);
      }
    });

    return Container(
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
            margin: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(100.0))),
            color: Colors.lightBlue[50],
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 250,right: 250)),
              Image(
                image: AssetImage(exercise.exerciseImage),
                height: 180,
                width: 180,
                fit: BoxFit.contain,
              ),
              Text(
                exercise.exerciseName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isWattingState ? 25 : 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                isWattingState ? 'Break Time' : '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isWattingState ? 60 : 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent[400],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    isWattingState ? '' : 'Set : ',
                    style: TextStyle(
                      fontSize: isWattingState ? 0 : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    isWattingState ? '' : '$noOfSetsDone/${exercise.noOfSet}',
                    style: TextStyle(
                      fontSize: isWattingState? 0 : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[700],
                    ),
                  ),
                ],
              ),
              
              // timer 

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: FractionalOffset.center,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child){
                              return new CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.purple[100],
                                  color: Colors.purple,
                                ),
                              );
                            }
                          )
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Text(
                              //   'Count Down',
                              //   style: themeData.textTheme.subhead,
                              // ),
                              AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return new Text(
                                    timerString,
                                    style: themeData.textTheme.display4,
                                  );
                                }
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      );
  }
}

class TimerPainter extends CustomPainter {
  
  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);     //  canvas.drawCircle(c, radius, paint)
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);     //  canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)
  }

  @override
  bool shouldRepaint(TimerPainter old){
    return animation.value != old.animation.value ||
            color != old.color ||
            backgroundColor != old.backgroundColor;

  }
  
}