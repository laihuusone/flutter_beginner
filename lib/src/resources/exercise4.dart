import 'package:beginner/src/models/exe4-weather.dart';
import 'package:flutter/material.dart';
import 'package:beginner/src/common/assets_common.dart';
import 'exercise4-details.dart';

class Exercise4 extends StatelessWidget {
  const Exercise4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercise 4 - Weather'),
        ),
        body: FutureBuilder(
          future: WeatherModel.readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              var items = data.data as List<WeatherModel>;
              return Container(
                margin: EdgeInsetsDirectional.all(10),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                Exercise4Details.routeName,
                                arguments: "null");
                          },
                          child: Stack(
                            children: [
                              Ink.image(
                                image: AssetImage(AssetsCommon.imageExe4),
                                height: size.height * 0.3,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  height: size.height * 0.3,
                                  width: double.infinity,
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  items[index].weatherMain,
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  items[index]
                                                      .weatherDescription,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  items[index]
                                                          .weatherTemp
                                                          .toString() +
                                                      "º",
                                                  style: TextStyle(
                                                      fontSize: 80,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  items[index].weatherBase,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
