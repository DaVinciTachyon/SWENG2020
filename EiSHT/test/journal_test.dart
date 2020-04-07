<<<<<<< HEAD
import 'package:flutter_test/flutter_test.dart';
import 'package:goals/journal/journal.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("testing class constructor instantiation", () {
    //create mock object
    Journal newJournal = Journal(1, "test", "05/01/2020", "15:40", false);

    //check each field correctly initialised
    expect(1, newJournal.id);
    expect("test", newJournal.body);
    expect("05/01/2020", newJournal.date);
    expect("15:40", newJournal.time);
    expect(false, newJournal.isDeleted);
  });

  test("testing JSON conversion", () {
    //create mock JSON object
    Map<String, dynamic> toJson() =>
        {
          'id': 3,
          'body': "test",
          'date': "05/01/2020",
          'time': "15:50",
          'isDeleted': false,
        };

    Map<String, dynamic> json = toJson();
    json.addAll(json);
    final journal = Journal.fromJson(json);

    //check each field correctly parsed from JSON
    expect(3, journal.id);
    expect("test", journal.body);
    expect("05/01/2020", journal.date);
    expect("15:50", journal.time);
    expect(false, journal.isDeleted);
  });

  testWidgets('testing journal Widget', (WidgetTester tester) async {
    //checking the widget can be correctly pumped with no errors
    await tester.pumpWidget(createWidgetForTesting(child: Journal(1, "test", "05/01/2020", "15:40", false)));
  });

}

Widget createWidgetForTesting({Widget child}){
  return MaterialApp(
    home: child,
  );
}
//  testWidgets('Journal entry tests', (WidgetTester tester) async {
//  });


//  //Group all related unit tests for journal entries
//  group("Journal Class testing", ()
//  {}

////
//    group("JournalScreenState Class testing", () {
//      sqfliteFfiInit();
////    test('simple sqflite example', () async {
////      var db = await databaseFactoryFfi.openDatabase('journal_db');
////      expect(await db.getVersion(), 0);
////      await db.close();
////    });

//      test("testing handleSubmission", () async {
////      var db = await databaseFactoryFfi.openDatabase('journal_db');
////      expect(await db.getVersion(), 0);
////      await db.execute('''
////        CREATE TABLE journal (
////            id INTEGER PRIMARY KEY,
////            body TEXT,
////            date TEXT,
////            time TEXT,
////            isDeleted BIT NOT NULL
////        )
////        ''');
//
//        JournalScreenState journalScreenState = JournalScreenState();
//        journalScreenState.handleSubmission(
//            "test input"); //note: this required removing _ from handleSubmission
//      });
=======
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goals/journal/journal.dart';
import 'package:goals/repository/model.dart';

void main() {
//  testWidgets('Journal entry tests', (WidgetTester tester) async {
//  });
  TestWidgetsFlutterBinding.ensureInitialized();

  //Group all related unit tests for journal entries
  group("Journal Class testing", () {
      test("testing class constructor instantiation", ()
      {
        //create mock object
        Journal newJournal = Journal(1, "test", "05/01/2020", "15:40", false);

        //check each field correctly initialised
        expect(1, newJournal.id);
        expect("test", newJournal.body);
        expect("05/01/2020", newJournal.date);
        expect("15:40", newJournal.time);
        expect(false, newJournal.isDeleted);
      });

      test("testing JSON conversion", ()
      {
        //create mock JSON object
        Map<String, dynamic> toJson() =>
            {
              'id': 3,
              'body': "test",
              'date': "05/01/2020",
              'time': "15:50",
              'isDeleted': false,
            };

        Map<String, dynamic> json = toJson();
        json.addAll(json);
        final journal = Journal.fromJson(json);

        //check each field correctly parsed from JSON
        expect(3, journal.id);
        expect("test", journal.body);
        expect("05/01/2020", journal.date);
        expect("15:50", journal.time);
        expect(false, journal.isDeleted);
      });


     /*
     * testWidgets('title',(WidgetTester tester) async {
     *  await test.pumpWidget(   < the widget we want to test > );
     *  //expect(find.text(Text, 'X'), findsOneWidget); <-- check for widget by text
     * }
     */
  });
//
//  group("JournalScreenState Class testing", () {
//    test("testing handleSubmission", () async {
//      await DatabaseCreator().initDatabase();
//      print("initialized");
//      JournalScreenState journalScreenState = JournalScreenState();
//      journalScreenState.handleSubmission("test input"); //note: this required removing _ from handleSubmission
//
//    });
>>>>>>> added test file for Journal entries with some basic tests to begin with
//    test("testing readData", () {
//        JournalScreenState journalScreenState = JournalScreenState();
//        journalScreenState.readData();
//        expect(false, journalScreenState.content.isEmpty);
//      });
<<<<<<< HEAD
//    });
=======
//  });
}
>>>>>>> added test file for Journal entries with some basic tests to begin with
