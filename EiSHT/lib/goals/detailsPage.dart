import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:EiSHT/goals/createGoals.dart';
import 'package:EiSHT/goals/ANewGoal.dart';
import 'package:EiSHT/goals/GoalDetails.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final goalName;
  String theGName;
  String miniG;
  String description;
  final newGoalName;
  final newMiniGoal;
  final newDescription;

  DetailsPage(
      {this.heroTag,
      this.goalName,
      this.newGoalName,
      this.newMiniGoal,
      this.newDescription});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
      return Colors.green[600];
    }
    return Theme.of(context).primaryColor;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
            color: Theme.of(context).scaffoldBackgroundColor,
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
                  itemCount: goals.length,
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
                                  builder: (context) =>
                                      GoalDetails(theGoal: goals[index])));
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
        child: Icon(Icons.add, color: Theme.of(context).primaryColor),

        //color: Colors.deepOrangeAccent,

        backgroundColor: Colors.white,
        onPressed: () async {
          ANewGoal newGoal = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateGoal(
                  goalType: widget.goalName,
                  imageSizeForTop: MediaQuery.of(context).size)));

          print(newGoal.goalName);
          goals.add(newGoal);

          // goals[0] = newGoal;

          setState(
            () {
              _goalWidget(goals[0]);
            },
          );
        },
      ),
    );
  }
}
