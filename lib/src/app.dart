import 'package:beginner/src/resources/home.dart';
import 'package:flutter/material.dart';
import 'resources/exercise4-details.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      home: HomePage(),
      routes: {
        Exercise4Details.routeName: (context) => Exercise4Details(),
      },
    );
  }
}