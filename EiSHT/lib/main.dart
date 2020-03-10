import 'package:flutter/material.dart';
import 'pin/pin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EiSHT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sign In'),
      debugShowCheckedModeBanner: false,
    );
  }
}
