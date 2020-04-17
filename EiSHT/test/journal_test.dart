import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/journal/journal.dart';
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