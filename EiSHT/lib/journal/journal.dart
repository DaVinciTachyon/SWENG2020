import "package:flutter/material.dart";

class JournalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JournalPageState();
}

class JournalPageState extends State<JournalPage> {
  String newEntry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Journal Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 15.0,
          top: 15.0,
          left: 15.0,
          right: 15.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            // ),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                // border: OutlineInputBorder(),
                hintText: "Make new entry...",
                prefixIcon: Icon(
                  Icons.note,
                  color: Colors.orange,
                ),
                // filled: true,
                // fillColor: Colors.orange,
              ),
              onChanged: (String text) {
                setState(() {
                  newEntry = text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
