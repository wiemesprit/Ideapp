import "package:flutter/material.dart";
import 'screens/login_screen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static List<User> users = [User('admin', 'admin@local', 'admin')];
  static User currentUser = null;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.green)),
      ),
      //inserting the app name
      home: LoginPage("Recette"),
      //end inserting the app name
    );
  }
}

class User {
  final username;
  final email;
  final pass;
  User(this.username, this.email, this.pass);
}
