import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

   MyApp._internal(); // named private constructor

  static final MyApp instance =
      MyApp._internal(); // single instance MyApp class

  factory MyApp() =>
      instance; // factory that return same instance of the MyApp class everytime

  int appState = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
