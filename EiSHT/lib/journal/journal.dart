import 'dart:io';

import "package:flutter/material.dart";

class JournalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JournalPageState();
}

class JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Journal Page"),
      ),
      body: JournalScreen(),
    );
  }
}

class JournalScreen extends StatefulWidget {
  @override
  State createState() => JournalScreenState();
}

class JournalScreenState extends State<JournalScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<JournalEntry> _entries =
      <JournalEntry>[]; // .. To hold all journal entries

  void _handleSubmission(String text) {
    _textController.clear();
    JournalEntry entry;
    if (text != null && text != "") {
      // .. to avoid null journal entries
      String thisInstant =
          "${DateTime.now()}"; // .. date and time of journal entry
      String month = thisInstant.substring(5, 7);
      String day = thisInstant.substring(8, 10);
      String time = thisInstant.substring(11, 16);
      // if u want to remove seconds from the time of entry,
      // change the second paramter of "time" from 19 to 16,
      // to add seconds back, change from 16 to 19 :).
      entry = JournalEntry(day, month, time, text); // .. journal entry call
      setState(() {
        _entries.insert(0, entry);
      });
    }
  }

  Widget _textComposer() {
    // .. user input
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ), // .. text box
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              // .. for journal entries
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                hintText: "Make new entry...",
                prefixIcon: Icon(
                  Icons.note,
                  color: Colors.orange,
                ),
              ),
              controller: _textController,
              onSubmitted: _handleSubmission,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              // .. save entry
              icon: Icon(Icons.save),
              color: Colors.orange,
              onPressed: () => _handleSubmission(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            //padding: EdgeInsets.all(15.0),
            itemBuilder: (_, int index) => _entries[index],
            itemCount: _entries.length,
          ),
        ),
        Divider(height: 5.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposer(),
        ),
      ],
    );
  }
}

class JournalEntry extends StatelessWidget {
  final String day;
  final String month;
  final String time;
  final String text;

  JournalEntry(this.day, this.month, this.time, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // .. date and time box
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange[200],
              border: Border.all(
                color: Colors.orange[200],
              ),
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 15.0),
            child: Text(
              "$day/$month\n$time",
            ), // .. date of entry will be implemented here
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // .. entry text box
                width: MediaQuery.of(context).size.width - 105,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  border: Border.all(
                    color: Colors.orange[200],
                  ),
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
To Do Yet:
implement date into every journal entry     (done)
make entries look better                    (    )
keep entries when exited the app            (    )
*/
