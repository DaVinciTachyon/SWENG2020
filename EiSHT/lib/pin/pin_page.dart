// import 'package:EiSHT/goals/goal_setting.dart';
import 'package:flutter/material.dart';
import '../goals/goal_setting.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "";
  String password = "1234";
  buttonPressed(String buttonText) {
    if (buttonText == "clear") {
      output = output.substring(0, output.length - 1);
    } else {
      output = output + buttonText;
      if (output == (password)) {
        // output = "WELCOME!";
        Navigator.push(context,
            MaterialPageRoute<bool>(builder: (BuildContext context) {
          return GoalSetting();
        }));
      }
    }
    setState(() {});
  }

  Widget buildButton(String numbers) {
    return new Expanded(
      child: new OutlineButton(
        shape: new CircleBorder(),
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          numbers,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(numbers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.center,
                  padding: new EdgeInsets.symmetric(
                      vertical: 80.0, horizontal: 12.0),
                  child: new Text(output,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ))),
              new Column(children: [
                new Row(children: [
                  new Expanded(
                    child: new FlatButton(
                      shape: new CircleBorder(),
                      padding: new EdgeInsets.all(24.0),
                      color: Colors.white,
                      highlightColor: Colors.white,
                      focusColor: Colors.white,
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      child: new Text(
                        "",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  new Expanded(
                    child: new FlatButton(
                      shape: new CircleBorder(),
                      padding: new EdgeInsets.all(24.0),
                      color: Colors.white,
                      highlightColor: Colors.white,
                      focusColor: Colors.white,
                      splashColor: Colors.white,
                      hoverColor: Colors.white,
                      child: new Text(
                        "",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  new Expanded(
                    child: new OutlineButton(
                      shape: new CircleBorder(),
                      padding: new EdgeInsets.all(24.0),
                      child: new Text(
                        "clear",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => buttonPressed("clear"),
                    ),
                  ),
                ]),
                new Divider(
                  height: 5.0,
                  color: Colors.white,
                ),
                new Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                ]),
                new Divider(
                  height: 5.0,
                  color: Colors.white,
                ),
                new Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                ]),
                new Divider(
                  height: 5.0,
                  color: Colors.white,
                ),
                new Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                ]),
                new Divider(
                  height: 5.0,
                  color: Colors.white,
                ),
                new Row(children: [
                  buildButton("0"),
                ])
              ]),
            ],
          ),
        ));
  }
}
