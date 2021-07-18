import 'package:flutter/material.dart';
import 'exercise1.dart';
import 'exercise2.dart';
import 'exercise3.1.dart';
import 'exercise4.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginner"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          children: [
            exerciseButton(context, 'Exercise 1', Exercise1()),
            exerciseButton(context, 'Exercise 2', Exercise2()),
            exerciseButton(context, 'Exercise 3', Exercise31()),
            exerciseButton(context, 'Exercise 4', Exercise4()),
          ],
        ),
      ),
    );
  }

  Padding exerciseButton(BuildContext context, String buttonName, exerFunc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => exerFunc));
        },
        child: Text(buttonName, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
