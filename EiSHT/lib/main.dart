import 'package:flutter/material.dart';
import 'pin/pin_page.dart';
import 'repository/model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  print("initialized");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        title: 'EiSHT',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepOrange[300],
          accentColor: Colors.deepOrange[700],
          scaffoldBackgroundColor: Colors.amber[50],
          buttonColor: Colors.white,

        ),

        home: MyHomePage(title: 'Sign In'),
        debugShowCheckedModeBanner: false,
      );
    }



}
