import 'package:beginner/src/widgets/widget-listview-weatherdetail.dart';
import 'package:flutter/material.dart';

class Exercise4Details extends StatefulWidget {
  const Exercise4Details({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  _Exercise4DetailsState createState() => _Exercise4DetailsState();
}

class _Exercise4DetailsState extends State<Exercise4Details> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: [
            Container(
              height: size.height,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NEXT 7 DAYS",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text("Updated 24m ago"),
                      ],
                    ),
                  ),
                  ListViewWeatherDetail()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
