import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/resources/exercise5-details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exercise5Favourite extends StatefulWidget {
  const Exercise5Favourite({Key? key}) : super(key: key);
  static const routeName = '/car-favourite';

  @override
  _Exercise5FavouriteState createState() => _Exercise5FavouriteState();
}

class _Exercise5FavouriteState extends State<Exercise5Favourite> {
  //
  late List<CarsModel> cars;

  @override
  void initState() {
    super.initState();
    cars = DataSource.cars;
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)!.settings;
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Favourite",
            style: TextStyle(fontSize: 25, color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black87,
          ),
        ),
        body: bookmarkBloc.itemsFavouriteLength == 0
            ? Center(
                child: Text(
                "Empty",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ))
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                    itemCount: bookmarkBloc.itemsFavouriteLength,
                    itemBuilder: (context, index) {
                      var carId = bookmarkBloc.itemsFavourite[index];
                      final item = cars.firstWhere((car) => car.id == carId);
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              Exercise5Details.routeName,
                              arguments: item.id.toString());
                        },
                        child: Card(
                          color: Colors.white60,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Ink.image(
                                    image: AssetImage(item.image[0].name),
                                    height: 100,
                                    fit: BoxFit.cover),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        item.price[0].price.toStringAsFixed(3),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        bookmarkBloc
                                            .deleteitemsFavourite(item.id);
                                        setState(() {
                                          // Set attribute 'favourite': true -> false
                                          item.isFavourite = false;
                                        });
                                      },
                                      icon: Icon(Icons.cancel_outlined)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }
}
