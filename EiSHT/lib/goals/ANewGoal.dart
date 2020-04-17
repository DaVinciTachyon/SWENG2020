import 'package:EiSHT/models/goalModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:EiSHT/repository/goalDatabase.dart';

class ANewGoal extends StatefulWidget {
  final db = GoalDatabase();
  String goalName;
  String goalMini;
  String goalDescription;
  double percentageComplete;
  DateTime endDay;
  DateTime dateNow;
  int id;

  ANewGoal(this.goalName, this.goalMini, this.goalDescription, this.endDay,
      {this.id, this.percentageComplete, this.dateNow});

  @override
  _ANewGoalState createState() => _ANewGoalState();

  num howMuchLeft() {
    final differenceOfTwo = this.endDay.difference(dateNow).inDays;
    return differenceOfTwo;
  }

  void setPercentageComplete(double val) async {
    this.percentageComplete = val;
    var _dbgoal = await db.fetchGoal(id);
    var newGoal = Goal(
      id: _dbgoal.id,
      goalName: _dbgoal.goalName,
      goalMini: _dbgoal.goalMini,
      goalDescription: _dbgoal.goalDescription,
      percentageComplete: val,
      endDay: _dbgoal.endDay,
      dateNow: _dbgoal.dateNow,
    );
    await db.updateGoal(newGoal);
  }

  double getPercentageComplete() {
    if (percentageComplete != null) {
      return percentageComplete * 100;
    }
    return 0;
  }
}

class _ANewGoalState extends State<ANewGoal> {
  bool isCompleted = false;
  int daysRemaining = 0;
  int percentageComplete = 0;
  final dateNow = DateTime.now();
  double differenceOfTwo = 0;
  @override
  Widget build(BuildContext context) {
    return null;
  }

  void setIsCompleted(bool isCompleted) {
    this.isCompleted = isCompleted;
  }

  bool getIsCompleted() {
    return this.isCompleted;
  }

  int getDaysRemaining() {
    return this.daysRemaining;
  }

  void setDaysRemaining(int daysLeft) {
    this.daysRemaining = daysLeft;
  }

  int howMuchLeft() {
    final differenceOfTwo = widget.endDay.difference(dateNow).inDays;
    return differenceOfTwo;
  }
}
