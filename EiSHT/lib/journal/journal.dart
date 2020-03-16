import "package:flutter/material.dart";

class JournalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JournalPageState();
}

class JournalPageState extends State<JournalPage> {
  String textEntry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            // ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Make new entry...",
                filled: true,
                fillColor: Colors.orange,
              ),
              onChanged: (text) {
                textEntry = text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
