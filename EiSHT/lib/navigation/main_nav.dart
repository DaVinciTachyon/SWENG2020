import "package:flutter/material.dart";
import '../goals/goal_setting.dart';
import '../journal/journal.dart';

class MainNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      RaisedButton(
          child: Text('Goals'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<bool>(builder: (BuildContext context) {
              return GoalSetting();
            }));
          }),
      RaisedButton(
          child: Text('Journal'),
          onPressed: () {
            print("journal pressed");
            Navigator.push(context,
                MaterialPageRoute<bool>(builder: (BuildContext context) {
              return JournalPage();
            }));
          })
    ]));
  }
}
