import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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

  @override

  Widget build(BuildContext context) {


    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Widget _buildNewGoalName() {
      return TextFormField(
        decoration : InputDecoration(labelText: 'New Goal Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Goal name is required.';
          }
          return null;
        },
        onSaved: (String value){
          _newGoalName = value;
        },
      );

    }
    Widget  _buildminiGoal() {
      return TextFormField(
        decoration : InputDecoration(labelText: 'Mini daily goal'),
        validator: (String value){
          if(value.isEmpty){
            return 'Gmini daily goal is required.';
          }
          return null;
        },
        onSaved: (String value){
          _miniGoal = value;
        },
      );

    }
    Widget _buildNewGoalDescription(){
      return TextFormField(
      decoration : InputDecoration(labelText: 'Goal Description'),
      validator: (String value){
        if(value.isEmpty){
          return 'Goal discription is required.';
        }
        return null;
      },
      onSaved: (String value){
        _newGoalDescription = value;
      },
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
      body: ListView(children: [
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
                    color: Colors.white,
                  ),
                  height: widget.imageSizeForTop.height - 100.0,
                  width: widget.imageSizeForTop.width,
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                margin: EdgeInsets.all(24.0),
                child: Form(
                  key:_formKey,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    _buildNewGoalName(),
                    _buildminiGoal(),
                    _buildNewGoalDescription(),


                    RaisedButton(
                      child: Text(
                      'Add New Goal', style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                    ),
                    ),
                      onPressed: () =>{
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save(),
                        // Navigator.of(context).pop(MaterialPageRoute(
                        //  builder: (context) =>
                      }
              //  }




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


Widget _creatingTheGoal( String _newGoalName ,String miniGoal, String _newGoalDescription) {

  return Padding(

);
}