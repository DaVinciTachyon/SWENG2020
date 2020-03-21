
import 'package:flutter/material.dart';
//import '../goals/goal_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation/main_nav.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String readPassword="",newPin ="";
  String output="";
  bool testBool;


  readBool() async {
    final prefs = await SharedPreferences.getInstance();
    testBool = prefs.getBool('setBool') ?? false;
  }
  readInPassword() async{ //reads password from local data and stores in string readPassword
    final prefs = await SharedPreferences.getInstance();
    readPassword = prefs.getString('setPassword') ?? "";
  }
  setBool() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('setBool', true);
  }
  setPassword() async{ // sets string 'newPin' in local database under 'setPassword'
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('setPassword', newPin);
  }

  buttonPressed(String buttonText) {
    if (buttonText == "clear" && output.length != 0) {
      output = output.substring(0, output.length - 1);
    }
    else if (buttonText == "clear") {

    }
    else {
      output = output + buttonText;
      readInPassword();
      if (output == (readPassword)) {
        output = "";
        Navigator.push(context,
            MaterialPageRoute<bool>(builder: (BuildContext context) {
              return MainNav();
            }));
      }

      setState(() {});
    }
  }
    buttonPressedPin() {

  }

  Widget buildButton(String numbers) {
    return new Expanded(
      child: new RaisedButton(
        color: Theme.of(context).buttonColor,
    }
    Widget buildButton(String numbers) {
      return new Expanded(
        child: new RaisedButton(
          color: Theme
              .of(context)
              .buttonColor,

          //highlightColor: Colors.blue,
          // highlightElevation: 50.0,
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
      readBool();
      if (testBool == false) {
        return Scaffold(
            body: Center(
              child: new Container(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Enter New Pin', style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      new TextField(
                        decoration: new InputDecoration(
                          hintText: 'Enter Pin Here',
                        ),
                        onSubmitted: (String result) {
                          setState(() {
                            setBool();
                            newPin = result;
                            setPassword();
                          });
                        },
                      ),
                    ]),
              ),
            )
        );
      }
      else {
        return Scaffold(

            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title, style: TextStyle(color: Colors.white)),
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
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
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          highlightColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          focusColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          splashColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          hoverColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
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
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          highlightColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          focusColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          splashColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          hoverColor: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: new Text(
                            "",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      new Expanded(
                        child: new RaisedButton(
                          shape: new CircleBorder(),
                          color: Theme
                              .of(context)
                              .buttonColor,
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
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                    ),
                    new Row(children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                    ]),
                    new Divider(
                      height: 5.0,
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                    ),
                    new Row(children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                    ]),
                    new Divider(
                      height: 5.0,
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                    ),
                    new Row(children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                    ]),
                    new Divider(
                      height: 5.0,
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
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

}
