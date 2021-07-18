import 'package:beginner/src/common/assets_common.dart';
import 'package:beginner/src/models/exe4-weather-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ListViewWeatherDetail extends StatefulWidget {
  @override
  _ListViewWeatherDetailState createState() => _ListViewWeatherDetailState();
}

class _ListViewWeatherDetailState extends State<ListViewWeatherDetail> {
  bool expanded = false;
  int dataTime = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.767,
      child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              var items = data.data as List<WeatherDetailModel>;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            toggleSubList(items, index);
                          },
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 100,
                                    width: 70,
                                    child: Image.asset(
                                      AssetsCommon.imageExe4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        Text(
                                          items[index]
                                              .weatherDescription,
                                          style: TextStyle(
                                              fontWeight:
                                                  FontWeight
                                                      .bold),
                                        ),
                                        Text(
                                          items[index]
                                                  .weatherTemp
                                                  .toString() +
                                              "º",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight:
                                                  FontWeight
                                                      .bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        Text(
                                          "MON",
                                          style: TextStyle(
                                              fontWeight:
                                                  FontWeight
                                                      .bold),
                                        ),
                                        Text(
                                          "17'",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                                  FontWeight
                                                      .bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4),
                          height: (dataTime == items[index].weatherDateTime) && expanded
                              ? 80
                              : 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  cardSubList(items[index].weatherPressure.toString()),
                                  cardSubList(items[index].weatherHumidity.toString()),
                                  cardSubList(items[index].weatherDewPoint.toString()),
                                  cardSubList(items[index].weatherWindSpeed.toString()),
                                ]),
                          ),
                        )
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  void toggleSubList(List<WeatherDetailModel> items, int index) {
    return setState(() {
      dataTime = items[index].weatherDateTime;
      expanded = !expanded;
    });
  }

  Card cardSubList(String info) {
    return Card(
      color: Colors.black12,
      child: Container(
        width: 100.0,
        height: 50.0,
        child: Center(
            child: Text(
          info,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }

  Future<List<WeatherDetailModel>> readJsonData() async {
    final jsondata =
        await rootBundle.loadString("assets/datas/databydailyandhourly.json");
    Map map = jsonDecode(jsondata);
    List dailylist = map['daily'];
    return dailylist.map((e) => WeatherDetailModel.fromJson(e)).toList();
  }
}
