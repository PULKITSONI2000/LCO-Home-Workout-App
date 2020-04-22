import 'package:flutter/material.dart';
import 'package:loc_home_workout_app/screens/ExerciseMode.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isRandom = false;
  GlobalKey<FormState>_key = new GlobalKey();

  @override
  Widget build(BuildContext context) {

  _launchURL(url) async {
    // const url = 'https://github.com/PULKITSONI2000';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        child: Form(
          key: _key,
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
                    Image(
                      image: AssetImage('assets/images/LCO_WORKOUT_LOGO_transparent.png'),
                      height: 300.0,
                      width: 300.0,
                    ),
                    Text(
                      "Select\nExercise Mode",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    /////////////////////////////////////////////////////////////////  
                    
                    // Random button

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
                                  child: Text(
                                    "Random Mode",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0
                                    ),
                                  ),
                                ),
                              ),
                              onPressed:(){
                                randomMode(); 
                              } 
                            ),
                            SizedBox(
                              height: 20.0,
                            ),

                            // Day wise mode

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
                                  child: Text(
                                    "Day Wise Mode",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0
                                    ),
                                  ),
                                ),
                              ),
                                onPressed:(){
                                  daywiseMode();
                                } 
                              ),

                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              )
              
            ),
        ),
      ),
      //////////////////////////////////////////
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(  
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
              accountName: Text("PULKITSONI"),
              accountEmail: Text("pulkitsoni2000@gmial.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/me.jpg"),
                ),
                onTap: (){
                  _creatorImage();
                },
              ),
              
            ),            
            ListTile(
              title: Text("Creator Info",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              
            ),
              ListTile(
              title: Text("Pulkit Soni"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("pulkitsoni2000@gmail.com"),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text("Alwar, Rajisthan"),
              leading: Icon(Icons.phone),
            ),

            Divider(),
            ListTile(
              title: Text("GitHub"),
              leading: Icon(Icons.code),
              onTap: (){
                _launchURL('https://github.com/PULKITSONI2000');
              },
            ),
            ListTile(
              title: Text("Challange Video Link"),
              leading: Icon(Icons.videocam),
              onTap: (){
                _launchURL('https://youtu.be/VFrKjhcTAzE');
              },
            ),

            Divider(),

            ListTile(
              title: Text("Time to Create this app : 2 week"),
              leading: Icon(Icons.timer)
            ),
            ListTile(
              title: Text("charge : 1999 ₹"),
              leading: Icon(Icons.payment),
            ),
          
            Divider(),

          ],
        ),
      )      );
  }

  randomMode(){
    isRandom = true;
    navigateToExerciseModePage();
  }

  daywiseMode(){
    isRandom = false;
    navigateToExerciseModePage();  
  }

  Future _creatorImage() async{
    return showDialog(  
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(
            'Creator : Pulkit Soni',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          content: SingleChildScrollView(
            child: Image(image: AssetImage('assets/images/me.jpg'),)
          ),
        );
      }
    );
  }


  navigateToExerciseModePage(){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>ExerciseMode(
            isRandom:this.isRandom,
          )
        ),
      );
  }
}