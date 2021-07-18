import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data_source.dart';

class WidgetCommons {
  static Widget colorbox(Color color, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: size.width * 1 / 10,
        height: size.height * 5 / 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  static Widget featurServices() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: DataSource.services.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[100],
                ),
                child: Icon(
                  DataSource.services[index]['icon'],
                  color: Colors.green[900],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(DataSource.services[index]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ))
            ],
          );
        });
  }
}
