import '../repository/model.dart';
import '../repository/repo_service_journal.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          "Journal Page",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
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
  Future<List<Journal>> _entries;
  String body;
  String time;
  int id;
  int count;
  String date;
  String content;
 @override
 initState()  {
    super.initState();
    _entries = RepositoryServiceJournal.getAllJournals();
    setState(() {

    });
  } // .. To hold all journal entries*/

  void readData() async {
    final journal = await RepositoryServiceJournal.getJournal(id);
    content = (journal.body);
  }
  void createJournal() async {


       count = await RepositoryServiceJournal.journalsCount();
      final journal = Journal(count, body, date, time, false);
      await RepositoryServiceJournal.addJournal(journal);
      setState(() {
        id = journal.id;
        _entries = RepositoryServiceJournal.getAllJournals();

      });

  }
  updateJournal(Journal journal) async {
    journal.body = 'please 🤫';
    await RepositoryServiceJournal.updateJournal(journal);
    setState(() {
      _entries = RepositoryServiceJournal.getAllJournals();
    });
  }

  deleteJournal(Journal journal) async {
    await RepositoryServiceJournal.deleteJournal(journal);
    setState(() {
      id = null;
      _entries = RepositoryServiceJournal.getAllJournals();
    });

  }


  void _handleSubmission(String text) {
    _textController.clear();
    //JournalEntry entry;
    if (text != null && text != "") {
      String thisInstant =
          "${DateTime.now()}"; // .. date and time of journal entry
      String month = thisInstant.substring(5, 7);
      String day = thisInstant.substring(8, 10);
      String times = thisInstant.substring(11, 16);
      // if u want to remove seconds from the time of entry,
      // change the second paramter of "time" from 19 to 16,
      // to add seconds back, change from 16 to 19 :).
      date = day+"/"+month;
      body = text;
      time = times;

      createJournal();
     /* entry = Journal(day, month, time, text); // .. journal entry call
      setState(() {
        _entries.insert(0, entry);
      });*/
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
              icon: Icon(Icons.class_),
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
    var futureBuilders = new FutureBuilder(
        future: _entries,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("has error");
            return new Text('Error: ${snapshot.error}');
          }
          else {
            return createListView(context, snapshot);
          }
        }
    );
    return Column(
      children: <Widget>[
        Flexible(
          child: futureBuilders,

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
  createListView(BuildContext context, AsyncSnapshot snapshot){
    List<Journal> _entries = snapshot.data;
      return new ListView.builder(
        itemCount: _entries.length,
        itemBuilder: (context, int index) {
          print("count is " + _entries.length.toString());
          id = index;
          return new Dismissible(
            //key: Key(_entries[index].body),
            key: UniqueKey(),
            onDismissed: (direction) {
              // .. delete entry
              // JournalEntry entryRemoved = _entries[index];
              Journal t =  _entries[index];
              deleteJournal(t);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  // .. delete message
                  content: Text("ENTRY REMOVED"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.65),
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  // action: SnackBarAction(
                  //   label: "UNDO",
                  //   onPressed: () {
                  //     // .. undo function needs to be implemented
                  //   },
                  // ),
                ),
              );
            },
          child: _entries[index],
          );
        },
      );
    }
}
class Journal extends StatelessWidget{
  int id;
  String body;
  String date;
  String time;
  bool isDeleted;

  Journal(this.id, this.body, this.date,this.time, this.isDeleted);

  Journal.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.body = json[DatabaseCreator.body];
    this.date = json[DatabaseCreator.date];
    this.time = json[DatabaseCreator.time];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
  }

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
            padding: EdgeInsets.all(7.0),
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
              "$date\n$time",
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ), // .. date of entry will be implemented here
          ),
          Container(
            // .. entry text box
            width: MediaQuery.of(context).size.width - 100,
            padding: EdgeInsets.all(15.0),
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
            child: Text(
              body,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*class JournalEntry extends StatelessWidget {
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
            padding: EdgeInsets.all(7.0),
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
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ), // .. date of entry will be implemented here
          ),
          Container(
            // .. entry text box
            width: MediaQuery.of(context).size.width - 100,
            padding: EdgeInsets.all(15.0),
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
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }*/
//}

/*
To Do Yet:
implement date into every journal entry                   (✔)
make entries look better                                  (✔)
swipe to delete an entry                                  (✔)
add undo deletion functionality                           ()
note saying swipe to delete after one entry               ()
keep entries when exited the app                          ()
*/
