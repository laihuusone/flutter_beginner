import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:beginner/src/resources/exercise5-cart.dart';
import 'package:beginner/src/resources/exercise5-favourite.dart';
import 'package:beginner/src/widgets/widget-gridview-cars.dart';
import 'package:beginner/src/widgets/widget-iconbtn-counter-cars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exercise5 extends StatefulWidget {
  const Exercise5({Key? key}) : super(key: key);

  @override
  _Exercise5State createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  //
  String query = '';
  late List<CarsModel> cars;

  @override
  void initState() {
    super.initState();
    cars = DataSource.cars;
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 260,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                icon: Icon(Icons.search),
                                hintText: 'Search',
                                border: InputBorder.none),
                            onChanged: (query) => searchCar(query),
                          ),
                        ),
                        IconBtnWithCounter(
                          icon: Icons.shopping_cart_outlined,
                          numOfItems: bookmarkBloc.itemsCartLength,
                          press: () {
                            Navigator.of(context)
                                .pushNamed(Exercise5Cart.routeName);
                          },
                        ),
                        IconBtnWithCounter(
                          icon: Icons.star_border,
                          numOfItems: bookmarkBloc.itemsFavouriteLength,
                          press: () {
                            Navigator.of(context)
                                .pushNamed(Exercise5Favourite.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5, left: 4),
                    child: Text("Available Cars",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(height: 529, child: CarsGridView(cars: cars))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  searchCar(String query) {
    final cars = DataSource.cars.where((car) {
      final nameLower = car.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.cars = cars;
    });
  }
}
