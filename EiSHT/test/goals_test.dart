import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/goals/ANewGoal.dart';
import 'package:EiSHT/goals/createGoals.dart';
import 'package:EiSHT/goals/detailsPage.dart';
import 'package:EiSHT/goals/goal_setting.dart';
import 'package:flutter/material.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("testing class constructor instantiation", () {
    //create mock object
    ANewGoal newGoal = ANewGoal("test goal", "mini goal test", "goal desc");

    //check each field correctly initialised
    expect("test goal", newGoal.goalName);
    expect("mini goal test", newGoal.goalMini);
    expect("goal desc", newGoal.goalDescription);
  });

  test("testing JSON conversion", () {
    //create mock JSON object
    Map<String, dynamic> toJson() =>
        {
          'goalName': "new goal",
          'goalMini': "test mini",
          'goalDescription': "testing",
        };

    Map<String, dynamic> json = toJson();
    json.addAll(json);
    final newGoal = newGoal.fromJson(json);

    //check each field correctly parsed from JSON
    expect("new goal", newGoal.goalName);
    expect("test", newGoal.goalMini);
    expect("testing", newGoal.goalDescription);

  });

  
}