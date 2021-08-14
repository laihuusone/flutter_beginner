import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:beginner/src/resources/exercise5-cart.dart';
import 'package:beginner/src/widgets/widget-carouselslider-cardetail.dart';
import 'package:beginner/src/widgets/widget-iconbtn-counter-cars.dart';
import 'package:beginner/src/widgets/widget-price-cardetail.dart';
import 'package:beginner/src/widgets/widget-specifications-cardetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exercise5Details extends StatefulWidget {
  const Exercise5Details({Key? key}) : super(key: key);
  static const routeName = '/car-details';

  @override
  _Exercise5DetailsState createState() => _Exercise5DetailsState();
}

class _Exercise5DetailsState extends State<Exercise5Details> {
  //
  late List<CarsModel> cars;

  Map priceBackgroundColor = {
    '12month': true,
    '6month': false,
    '1month': false
  };

  @override
  void initState() {
    super.initState();
    cars = DataSource.cars;
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    final carId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedCar = cars.firstWhere((car) => car.id == carId);
    final selectedPrice = getPrice(selectedCar.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black87,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 5, right: 10),
            child: IconBtnWithCounter(
                icon: Icons.shopping_cart_outlined,
                numOfItems: bookmarkBloc.itemsCartLength,
                press: () {
                  Navigator.of(context).pushNamed(Exercise5Cart.routeName);
                }),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedPrice.period == ''
                        ? selectedCar.price[0].period
                        : selectedPrice.period,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  Text(
                    selectedPrice.price == 0
                        ? selectedCar.price[0].price.toStringAsFixed(3)
                        : selectedPrice.price.toStringAsFixed(3),
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: selectedCar.isCart
                  ? null
                  : () {
                      // Add id to Cart list
                      bookmarkBloc.addItemsCart(selectedCar.id);
                      // Reset index image
                      bookmarkBloc.indexImageCarDetail = 0;
                      setState(() {
                        // Set attribute 'cart': false -> true
                        selectedCar.isCart = true;
                      });
                    },
              child: Text(selectedCar.isCart ? "Added Cart" : "Add Cart"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple[400])),
            )
          ],
        ),
      ),
      body: AbsorbPointer(
        absorbing: selectedCar.isCart,
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(selectedCar.name,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                CarDetailCarouselSlider(images: selectedCar.image),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedCar.price.length,
                    itemBuilder: (context, index) {
                      var item = selectedCar.price[index];
                      return GestureDetector(
                        onTap: () {
                          setPrice(selectedCar.price, item);
                        },
                        child: CarDetailPrice(
                          title: item.period,
                          price: item.price,
                          priceBackgroundColor: item.isChoice,
                        ),
                      );
                    }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "SPECIFICATIONS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  height: 60,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    SpecificationInfo(
                        title: 'Length',
                        info: selectedCar.length.toStringAsFixed(3)),
                    SpecificationInfo(
                        title: 'Height',
                        info: selectedCar.height.toStringAsFixed(3)),
                    SpecificationInfo(
                        title: 'Width',
                        info: selectedCar.width.toStringAsFixed(3)),
                    SpecificationInfo(
                        title: 'Weight',
                        info: selectedCar.weight.toStringAsFixed(3)),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setPrice(List<Prices> pricesList, Prices item) {
    pricesList.forEach((itemPrice) {
        setState(() {
          if (itemPrice == item) {
            itemPrice.isChoice = true;
          } else {
            itemPrice.isChoice = false;
          }
        });
    });
  }

  Prices getPrice(List<Prices> pricesList) {
    Prices price = new Prices(period: '', price: 0, isChoice: false);
    pricesList.forEach((item) { 
      if (item.isChoice) {
        price = item;
      }
    });
    return price;
  }
}