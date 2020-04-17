import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/navigation/main_nav.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("Navigation Constructor", () {
    MainNav nav = MainNav();
    expect(nav.buttonHeight, 100);
  });

  group('Nav UI Testing', () {
    Widget makeTestableWidget({Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    testWidgets("Goals", (WidgetTester tester) async {
      MainNav nav = MainNav();
      await tester.pumpWidget(makeTestableWidget(
        child: nav,
      ));
      expect(find.text('Goals'), findsOneWidget);
      await tester.tap(find.byKey(Key("Goals")));
      await tester.pump();
    });

    testWidgets("Text Journal", (WidgetTester tester) async {
      MainNav nav = MainNav();
      await tester.pumpWidget(makeTestableWidget(
        child: nav,
      ));
      expect(find.text('Text Journal'), findsOneWidget);
      await tester.tap(find.byKey(Key("Text Journal")));
      // await tester.pump();
    });

    testWidgets("Audio Journal", (WidgetTester tester) async {
      MainNav nav = MainNav();
      await tester.pumpWidget(makeTestableWidget(
        child: nav,
      ));
      expect(find.text('Audio Journal'), findsOneWidget);
      await tester.tap(find.byKey(Key("Audio Journal")));
      // await tester.pump();
    });
  });
}
