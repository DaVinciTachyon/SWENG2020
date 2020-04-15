import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'detailsPage.dart';
import 'ANewGoal.dart';

class CreateGoal extends StatefulWidget {
  final goalType;
  final imageSizeForTop;

  CreateGoal({this.goalType, this.imageSizeForTop});
  @override
  _CreateGoalState createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  String _newGoalName;
  String _miniGoal;
  String _newGoalDescription;
  DateTime _date = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    Future<Null> selectDate(BuildContext context) async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: DateTime(1970),
          lastDate: DateTime(2100));
      if ((picked != null) && (picked != _date)) {
        print(_date.toString());
        setState(
              () {
            _date = picked;
            print(_date.toString());
          },
        );
      }
    }
    Widget _buildNewGoalName() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'New Goal Name'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Goal name is required.';
          }
          return null;
        },
        onSaved: (String value) {
          _newGoalName = value;
        },
      );
    }

    Widget _buildMiniGoal() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Mini daily goal'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Mini daily goal is required.';
          }
          return null;
        },
        onSaved: (String value) {
          _miniGoal = value;
        },
      );
    }

    Widget _buildNewGoalDescription() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Why do you want to achieve this goal?'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Goal discription is required.';
          }
          return null;
        },
        onSaved: (String value) {
          _newGoalDescription = value;
        },
      );
    }


    Widget _buildDatePicker() {
      return Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        child: Column(children: <Widget>[
          Text('Select date you wish to complete your goal by:',
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 16.0,
                  color: Colors.grey[600])),
          SizedBox(height: 20),
          Container(
            height: 75.0,
            width: 75,

            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,

              borderRadius: BorderRadius.circular(8.0),
            ),

            child: IconButton(
                icon: Icon(

                  Icons.calendar_today,
                  size: 60,
                  color: Colors.white,
                ),
                onPressed: () {
                  selectDate(context);
                }
            ),
          ),
        ],
        ),
      );
    }









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
            'Create ' + widget.goalType,
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
                  height: widget.imageSizeForTop.height - 82.0,
                  width: widget.imageSizeForTop.width,
                  color: Colors.transparent),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.orange[50],
                  ),
                  height: widget.imageSizeForTop.height - 100.0,
                  width: widget.imageSizeForTop.width,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                margin: EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNewGoalName(),
                      _buildMiniGoal(),
                      _buildNewGoalDescription(),
                      SizedBox(height: 20),
                      _buildDatePicker(),

                      SizedBox(height: 10),
                      RaisedButton(
                        shape : RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          //side: BorderSide(color: Colors.red)
                        ),
                        child: Text(
                          'Add New Goal',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()&& _date==DateTime.now() ) {
                            return;
                          }
                          else if(_formKey.currentState.validate()&& _date!=DateTime.now() ) {
                            _formKey.currentState.save();
                            ANewGoal _theGoal = new ANewGoal(_newGoalName,
                                _miniGoal, _newGoalDescription, _date);
                            Navigator.pop(context, _theGoal);
                          };
                        },
                      ),

                    ],
                  ),
                ),
              ),

            ],

          ),

        ],
      ),
    );
  }
}
