import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'createGoals.dart';
import 'ANewGoal.dart';

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
        color: Colors.orange,
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

  void _listOfGoals(ANewGoal makeGoal) {
    ListView();
  }

  Widget build(BuildContext context) {
    if (widget.newGoalName != null) {
      return Scaffold(
        backgroundColor: Colors.orange,
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
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height - 82.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent),
                Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover),
                      ),
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  //left: 50,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    //color: Colors.orange,
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.newGoalName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Monserrat',
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(width: 80.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          scrollDirection: Axis.vertical,
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.orange,
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.heroTag), fit: BoxFit.cover),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                //left: 50,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  //color: Colors.orange,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Create Goal',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Monserrat',
                          fontSize: 40.0,
                        ),
                      ),
                      SizedBox(width: 80.0),
                      InkWell(
                        onTap: () async {
                          ANewGoal newGoal = await Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => CreateGoal(
                                      goalType: widget.goalName,
                                      imageSizeForTop:
                                          MediaQuery.of(context).size)));
                          Navigator.pop(context, newGoal);

                          print(newGoal.goalName);
                          goals.add(newGoal);
                          goals[0] = newGoal;
                          setState(() {
                            _goalWidget(goals[0]);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 5.0),
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.orangeAccent),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
