import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ANewGoal extends StatefulWidget {
  String goalName;
  String goalMini;
  String goalDescription;


  ANewGoal(this.goalName, this.goalMini, this.goalDescription);
  @override
  _ANewGoalState createState() => _ANewGoalState();
}

class _ANewGoalState extends State< ANewGoal> {
  bool isCompleted = false;
  int daysRemaining = 0;
  @override
  Widget build(BuildContext context) {
    return null;
  }


  void setIsCompleted(bool isCompleted){

    this.isCompleted = isCompleted;



  }
  bool getIsCompleted(){

    return this.isCompleted;

  }
  int getDaysRemaining(){

    return this.daysRemaining;

  }
  void setDaysRemaining(int daysLeft){

   this.daysRemaining = daysLeft;

  }




}

