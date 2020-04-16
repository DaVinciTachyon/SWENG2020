import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/navigation/main_nav.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("Navigation Constructor", () {
    MainNav nav = MainNav();
    expect(nav.buttonHeight, 150);
  });

  group('Nav UI Testing', () {
    Widget makeTestableWidget({Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    testWidgets("Welcome to", (WidgetTester tester) async {
      MainNav nav = MainNav();
      await tester.pumpWidget(makeTestableWidget(
        child: nav,
      ));
      //expect(find.text('Welcome to'), findsOneWidget);
    });
  });
}
