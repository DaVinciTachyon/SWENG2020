import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import '../goals/goal_setting.dart';
import '../journal/journal.dart';

class MainNav extends StatelessWidget {
  final double buttonHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height) -
                buttonHeight -
                buttonHeight -
                buttonHeight -
                15,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            padding: EdgeInsets.all(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _logo(),
                  ],
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Welcome to",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nEiSHT",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 60,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          _button(context, GoalSetting(), buttonHeight, "Goals"),
          _button(context, JournalPage(), buttonHeight, "Text Journal"),
          _button(context, null, buttonHeight, "Audio Journal"),
          // .. TODO: replace "null" with audio entries page when built
        ],
      ),
    );
  }
}

Widget _logo() {
  return FlatButton(
    shape: new CircleBorder(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular((75 / 2)),
      child: Image(
        image: AssetImage('images/logo-ed.png'),
        fit: BoxFit.cover,
        height: 70,
        width: 70,
      ),
    ),
    onPressed: () {},
  );
}

Widget _button(BuildContext context, Widget destPage, double height, String text) {
  return Container(
    width: double.infinity,
    height: height,
    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
    child: RaisedButton(
      elevation: 0.5,
      color: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(75.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (BuildContext context) {
              return destPage;
            },
          ),
        );
      },
    ),
  );
}

// Widget _journalDropDown(BuildContext context) {
//   var _buttons = [_textEntriesButton(context), _audioEntriesButton(context)];

//   return Container(
//     width: double.infinity,
//     height: 150,
//     padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
//     child: DropdownButton<Widget>(
//       items: _buttons.map((Widget dropDownWidgetItem) {
//         return DropdownMenuItem<Widget>(
//           value: dropDownWidgetItem,
//           child: Text("Text goes here"),
//         );
//       }).toList(),
//     ),
//   );
// }

// i tried to get that to work, maybe later
