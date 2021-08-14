import 'package:beginner/src/resources/home.dart';
import 'package:flutter/material.dart';
import 'resources/exercise4-details.dart';
import 'resources/exercise5-cart.dart';
import 'resources/exercise5-details.dart';
import 'resources/exercise5-favourite.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme: ThemeData(
        brightness: Brightness.light,
        // fontFamily: "AtkinsonHyperlegible-Regular",
      ),
      home: HomePage(),
      routes: {
        Exercise4Details.routeName: (context) => Exercise4Details(),
        Exercise5Details.routeName: (context) => Exercise5Details(),
        Exercise5Favourite.routeName: (context) => Exercise5Favourite(),
        Exercise5Cart.routeName: (context) => Exercise5Cart()
      },
    );
  }
}