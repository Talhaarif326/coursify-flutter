import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/routes_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // named private constructor

  static final MyApp instance =
      MyApp._internal(); // single instance MyApp class

  factory MyApp() =>
      instance; // factory that return same instance of the MyApp class everytime

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeDate(),
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
