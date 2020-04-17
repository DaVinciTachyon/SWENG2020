import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:EiSHT/goals/createGoals.dart';
import 'package:EiSHT/goals/ANewGoal.dart';
import 'package:EiSHT/goals/GoalDetails.dart';
import 'package:EiSHT/models/goalModel.dart';
import 'package:EiSHT/repository/goalDatabase.dart';

class DetailsPage extends StatefulWidget {
  final id;
  final heroTag;
  final goalName;
  String theGName;
  String miniG;
  String description;
  final newGoalName;
  final newMiniGoal;
  final newDescription;

  DetailsPage(
      {this.id,
      this.heroTag,
      this.goalName,
      this.newGoalName,
      this.newMiniGoal,
      this.newDescription});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final db = GoalDatabase();
  List<ANewGoal> goals = List();
  @override
  Widget _goalWidget(ANewGoal makeGoal) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      //color: Colors.orange,
      child: Row(
        children: <Widget>[
          Text(
            makeGoal.goalName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Monserrat',
              fontSize: 40.0,
            ),
          ),
        ],
      ),
    );
  }

//-----------------------------------------------------------------------------

  Color getColour(ANewGoal checkGoal) {
    if (checkGoal.getPercentageComplete() > 99) {
      print(checkGoal.getPercentageComplete());
      return Colors.lightGreenAccent;
    }
    return Colors.deepOrangeAccent;
  }

  void _setGoal() async {
    var _dbgoal = await db.fetchGoal(widget.id);
    if (_dbgoal != null) {
      ANewGoal _goal = ANewGoal(
        _dbgoal.goalName,
        _dbgoal.goalMini,
        _dbgoal.goalDescription,
        _dbgoal.endDay,
        id: _dbgoal.id,
        percentageComplete: _dbgoal.percentageComplete,
        dateNow: _dbgoal.dateNow,
      );

      goals.insert(0, _goal);
      setState(
        () {
          _goalWidget(goals[0]);
        },
      );
    }
  }

  Widget build(BuildContext context) {
    _setGoal();
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Text(
            widget.goalName,
            style: TextStyle(
                fontFamily: 'Monserrat', fontSize: 18.0, color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover),
                      ),
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: goals.length > 0 ? 1 : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Card(
                        color: getColour(goals[index]),
                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: InkWell(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                                  child: Text(
                                    goals[index].goalName,
                                    style: TextStyle(
                                        fontSize: 24.0, color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                  child: Text(
                                    '${goals[index].getPercentageComplete().toStringAsFixed(2)}' +
                                        '% ',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => GoalDetails(
                                        theGoal: goals[index],
                                      )));
                            }),
                      ),
                    );
                  }),
            ],
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.deepOrangeAccent),

        //color: Colors.deepOrangeAccent,

        backgroundColor: Colors.white,
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateGoal(
                  id: widget.id,
                  goalType: widget.goalName,
                  imageSizeForTop: MediaQuery.of(context).size)));

          _setGoal();
        },
      ),
    );
  }
}
