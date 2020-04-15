import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ANewGoal extends StatefulWidget {
  String goalName;
  String goalMini;
  String goalDescription;
  double percentageComplete;
  DateTime endDay;
  final dateNow = DateTime.now();

  ANewGoal(this.goalName, this.goalMini, this.goalDescription, this.endDay);

  @override
  _ANewGoalState createState() => _ANewGoalState();

  num howMuchLeft() {
    final differenceOfTwo = this.endDay
        .difference(dateNow)
        .inDays;
    return differenceOfTwo;
  }

  void setPercentageComplete(double val) {
    this.percentageComplete = val;
  }

  double getPercentageComplete() {
   if(percentageComplete!= null) {
     return percentageComplete * 100;
   }
   return 0 ;
  }
}

class _ANewGoalState extends State< ANewGoal> {
  bool isCompleted = false;
  int daysRemaining = 0;
  int percentageComplete =0;
  final dateNow = DateTime.now();
  double differenceOfTwo =0;
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
  int howMuchLeft(){

    final differenceOfTwo = widget.endDay.difference(dateNow).inDays;
    return differenceOfTwo ;
  }


}

