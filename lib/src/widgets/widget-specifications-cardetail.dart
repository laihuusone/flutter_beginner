import 'package:flutter/material.dart';

class SpecificationInfo extends StatelessWidget {
  const SpecificationInfo({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            Text(
              info,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}