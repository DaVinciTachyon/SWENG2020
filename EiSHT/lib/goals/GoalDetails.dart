import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ANewGoal.dart';

class GoalDetails extends StatefulWidget {
  ANewGoal theGoal;
  int id;

  GoalDetails({this.theGoal});
  @override
  _GoalDetailsState createState() => _GoalDetailsState();
}

DateTime change = DateTime.now();

class _GoalDetailsState extends State<GoalDetails> {
  double _height = 100;
  double _width = 100;
  var _color = Colors.orange[700];
  bool _hasBeenPressed = false;
  double _progress = 0;
  int daysLeft = 0;

  _animateContainer() {
    setState(() {
      _color =
          _color == Colors.orange[700] ? Colors.yellow : Colors.orange[700];
    });
  }

  _getColour() {
    if (_progress > .99) {
      _progress = 100;
      return Colors.lightGreenAccent;
    }
    return Colors.deepOrangeAccent;
  }

  _goalCompleted() {
    if (_progress > .99) {
      return Text(
        'HURRAY, You have completed your goal!',
        style: TextStyle(fontSize: 24, color: Colors.white),
        textAlign: TextAlign.center,
      );
    }
    return Text(
      'Have you completed your goal today? (Tap)',
      style: TextStyle(fontSize: 24, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  _start() {
    _progress = widget.theGoal.getPercentageComplete() / 100;
  }

  Widget build(BuildContext context) {
    _start();
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.theGoal.goalMini,
              style: TextStyle(
                  fontFamily: 'Monserrat', fontSize: 27.0, color: Colors.white),
            ),
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(45.0)),
              ),
              SizedBox(height: 60),
              Card(
                color: Colors.orange[50],
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: _getColour(), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'Reminder of why you chose this goal.'
                              ' Stay positive you can do this!\n\n\n' +
                          '"' +
                          widget.theGoal.goalDescription +
                          '"\n',
                      style: TextStyle(fontSize: 24, color: _getColour()),
                      textAlign: TextAlign.center),
                ),
              ),

              SizedBox(height: 30),
              Card(
                color: _getColour(),
                child: OutlineButton(
                    padding: EdgeInsets.all(8.0),
                    child: _goalCompleted(),
                    onPressed: () {
                      _animateContainer();
                      _progress =
                          _progress + (1 / widget.theGoal.howMuchLeft());
                      widget.theGoal.setPercentageComplete(_progress);
                      if (_progress > .99) {
                        _color = Colors.lightGreenAccent;
                      }
                      DateTime isNextDay = DateTime.now();

                      if (change.difference(isNextDay).inDays == 1) {
                        _color = Colors.orange;
                        change = isNextDay;
                      }
                    }),
              ),
              SizedBox(height: 40),

              //SizedBox(height: 10),
              Text(
                'Look how far you are!',
                style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),
              ),
              LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.amber,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
