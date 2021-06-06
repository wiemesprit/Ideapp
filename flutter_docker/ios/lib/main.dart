import "package:flutter/material.dart";
import 'screens/Login_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        //inserting the app name
home: LoginPage(" MyApp"));
    //end inserting the app name
  }
}
