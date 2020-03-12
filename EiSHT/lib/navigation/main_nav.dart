import "package:flutter/material.dart";
import '../goals/goal_setting.dart';
import '../journal/journal.dart';

class MainNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 490,
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(
                color: Colors.orange,
              ),
            ),
            padding: EdgeInsets.all(100),
            alignment: Alignment.center,
            child: RichText(
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
          ),
          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Text(
                "Goals",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: Text(
                "Journal",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
