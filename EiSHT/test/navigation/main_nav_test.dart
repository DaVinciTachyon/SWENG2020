import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:EiSHT/navigation/main_nav.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("Navigation Constructor", () {
    MainNav nav = MainNav();
    expect(nav.buttonHeight, 150);
  });
}
