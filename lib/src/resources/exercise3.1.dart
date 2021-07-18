import 'package:flutter/material.dart';
import 'package:beginner/src/common/assets_common.dart';
import 'package:beginner/src/common/widget_commons.dart';
import 'package:flutter/rendering.dart';

class Exercise31 extends StatelessWidget {
  const Exercise31({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.27,
              child: Stack(
                children: [
                  Container(
                      child: Image.asset(
                    AssetsCommon.imageExe2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                      bottom: -1,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: 'Search',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ongoing Promo",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: ExactAssetImage(AssetsCommon.imageExe3),
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                        bottom: 15,
                        right: 30,
                        child: Container(
                          height: 30,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.amber[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Sure, Let's go!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Feature Service",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Container(
                    height: size.height * 0.29,
                    alignment: Alignment.bottomCenter,
                    child: WidgetCommons.featurServices(),
                  ),
                  SizedBox(height:50)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
