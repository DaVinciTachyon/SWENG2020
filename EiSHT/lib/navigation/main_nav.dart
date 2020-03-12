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
            height: 300,
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(
                color: Colors.orange,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.only(
              top: 35.0,
              bottom: 15.0,
              left: 15.0,
              right: 15.0,
            ),
            padding: EdgeInsets.all(100),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "\nEiSHT",
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ]
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Text(
                "Goals",
                style: TextStyle(
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
            padding: EdgeInsets.all(15.0),
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Text(
                "Journal",
                style: TextStyle(
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
