import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import '../goals/goal_setting.dart';
import '../journal/journal.dart';
import '../audioRecorder/audioPage.dart';
class MainNav extends StatelessWidget {
  final int buttonHeight=150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[

          Container(

            width: double.infinity,
            //height: 490,
            height:(MediaQuery.of(context).size.height)-buttonHeight-buttonHeight-15,
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
              border: Border.all(
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            padding: EdgeInsets.all(90),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                     // padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      shape: new CircleBorder(),
                    // color: Colors.white,
                      child: ClipRRect
                        (
                        borderRadius: BorderRadius.circular((75/2)),

                        child:Image(
                          image: AssetImage('images/logo-ed.png'),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70),
                      //icon: Image.asset('images/logo.jpg'),
                     // icon: Image.asset('037-fame.png'),
                      ),


                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute<bool>(
                            builder: (BuildContext context) {
                              return AudioPage();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                RichText(
                //  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "\nEiSHT",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 60,
                        ),
                      ),
                    ]
                  ),
                ),

              ],
            ),
          ),

          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: RaisedButton(
              elevation: 0.5,
              color: Theme
                  .of(context)
                  .buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Text(
                "Goals",
                style: TextStyle(
                  fontSize: 25.0,

                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (BuildContext context) {
                      return GoalSetting();
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: RaisedButton(
              elevation: 0.5,

              color: Theme
                  .of(context)
                  .buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Text(
                "Journal",
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (BuildContext context) {
                      return JournalPage();
                    },
                  ),
                );
              },
            ),
          ),

        ],
      ),


    );
  }
}
