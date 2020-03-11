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
      entry = JournalEntry(text);
      setState(() {
        _entries.insert(0, entry);
      });
    }
  }

  Widget _textComposer() {
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
            padding: EdgeInsets.all(15.0),
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
  final String text;

  JournalEntry(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Text("DATE..."),           // .. date of entry will be implemented here
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15.0),
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
implement date into every journal entry
make entries look better
keep entries when exited the app
*/
