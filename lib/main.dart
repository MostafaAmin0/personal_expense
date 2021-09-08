import 'package:flutter/material.dart';
import 'package:personal_expense/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter app",
      home: MyHomePage(),
    );
  }
}
