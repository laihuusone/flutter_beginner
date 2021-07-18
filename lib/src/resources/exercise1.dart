import 'package:beginner/src/common/constant.dart';
import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/common/assets_common.dart';
import 'package:beginner/src/common/style_common.dart';
import 'package:beginner/src/common/widget_commons.dart';
import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
                flex: 50,
                child: Container(
                  child: Image.asset(AssetsCommon.imageExe1,
                      fit: BoxFit.fitHeight),
                )),
            Expanded(
                flex: 10,
                child: Center(
                    child: Text(Constant.titleExe1,
                        style: StyleCommon.titleStyle()))),
            Expanded(
              flex: 40,
              child: Container(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: DataSource.colors
                      .map((color) => WidgetCommons.colorbox(color, size))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
