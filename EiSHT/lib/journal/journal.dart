import '../models/journalModel.dart';
import '../repository/model.dart';
import '../repository/repo_service_journal.dart';


import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfLiteCrud(title: 'Flutter Demo Home Page'),
    );
  }
}

class SqfLiteCrud extends StatefulWidget {
  SqfLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfLiteCrudState createState() => _SqfLiteCrudState();
}

class _SqfLiteCrudState extends State<SqfLiteCrud> {
  final _formKey = GlobalKey<FormState>();
  Future<List<Journal>> future;
  String body;
  int id;
  String date;
  @override
  initState() {
    super.initState();
    future = RepositoryServiceJournal.getAllJournals();
  }

  void readData() async {
    final journal = await RepositoryServiceJournal.getJournal(id);
    print(journal.body);
  }

  updateJournal(Journal journal) async {
    journal.body = 'please 🤫';
    await RepositoryServiceJournal.updateJournal(journal);
    setState(() {
      future = RepositoryServiceJournal.getAllJournals();
    });
  }

  deleteJournal(Journal journal) async {
    await RepositoryServiceJournal.deleteJournal(journal);
    setState(() {
      id = null;
      future = RepositoryServiceJournal.getAllJournals();
    });
  }

  Card buildItem(Journal journal) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'body: ${journal.body}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'journal: ${journal.date}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateJournal(journal),
                  child: Text('Update journal', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteJournal(journal),
                  child: Text('Delete'),
                ),
              ],
            )
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

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),

      onSaved: (value) => body = value,
    );
  }

  void createJournal() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceJournal.journalsCount();
      final journal = Journal(count, body, date, false);
      await RepositoryServiceJournal.addJournal(journal);
      setState(() {
        id = journal.id;
        future = RepositoryServiceJournal.getAllJournals();
      });
      print(journal.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqfLite CRUD'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createJournal,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),
          FutureBuilder<List<Journal>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.map((journal) => buildItem(journal)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }


}
}
