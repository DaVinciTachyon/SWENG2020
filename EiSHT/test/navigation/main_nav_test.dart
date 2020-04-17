import 'package:EiSHT/goals/goal_setting.dart';
import 'package:EiSHT/journal/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/navigation/main_nav.dart';
import 'package:mockito/mockito.dart';
import 'package:EiSHT/audioRecorder/audioPage.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

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
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: MainNav(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.byKey(Key("Goals")), findsOneWidget);
      await tester.tap(find.byKey(Key("Goals")));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// check for new page
      expect(find.byType(GoalSetting), findsOneWidget);
    });

    testWidgets("Text Journal", (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: MainNav(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.byKey(Key("Text Journal")), findsOneWidget);
      await tester.tap(find.byKey(Key("Text Journal")));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// check for new page
      expect(find.byType(JournalPage), findsOneWidget);
    });

    testWidgets("Audio Journal", (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          home: MainNav(),
          navigatorObservers: [mockObserver],
        ),
      );

      expect(find.byKey(Key("Audio Journal")), findsOneWidget);
      await tester.tap(find.byKey(Key("Audio Journal")));
      await tester.pumpAndSettle();

      /// Verify that a push event happened
      verify(mockObserver.didPush(any, any));

      /// check for new page
      expect(find.byType(AudioPage), findsOneWidget);
      // MainNav nav = MainNav();
      // await tester.pumpWidget(makeTestableWidget(
      //   child: nav,
      // ));
      // expect(find.text('Audio Journal'), findsOneWidget);
      // await tester.tap(find.byKey(Key("Audio Journal")));
      // await tester.pump();
    });
  });
}
