
class Exercise {

  int _exerciseId;
  String _exerciseName;
  String _exerciseImage;
  int _exerciseduration;
  int _noOfSet;

  Exercise(this._exerciseId, this._exerciseName, this._exerciseduration,this._exerciseImage, this._noOfSet);

  //Setter

  set exerciseId(int exerciseId){
    this._exerciseId = exerciseId;
  }
  set exerciseName(String exerciseName){
    this._exerciseName = exerciseName;
  }
  set exerciseImage(String exerciseImage){
    this._exerciseImage = exerciseImage;
  }
  set exerciseduration(int exerciseduration){
    this._exerciseduration = exerciseduration;
  }
  set noOfSet(int noOfSet){
    this._noOfSet = noOfSet;
  }

  //  Getter

  int get exerciseId => this._exerciseId;
  String get exerciseName => this._exerciseName;
  int get exerciseduration => this._exerciseduration;
  String get exerciseImage => this._exerciseImage;
  int get noOfSet => this._noOfSet;

}

