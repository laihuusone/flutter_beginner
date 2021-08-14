import 'package:beginner/src/common/data_source.dart';
import 'package:beginner/src/models/exe5-cars-model.dart';
import 'package:beginner/src/provider/bookmark-model.dart';
import 'package:beginner/src/resources/exercise5.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exercise5Cart extends StatefulWidget {
  const Exercise5Cart({Key? key}) : super(key: key);
  static const routeName = '/car-cart';

  @override
  _Exercise5Cart createState() => _Exercise5Cart();
}

class _Exercise5Cart extends State<Exercise5Cart> {
  //
  late List<CarsModel> cars;
  //
  bool allCheckBoxCart = false;

  @override
  void initState() {
    super.initState();
    cars = DataSource.cars;
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(fontSize: 25, color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black87,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercise5()),
                );
              },
              icon: Icon(Icons.home_outlined),
              iconSize: 25,
              color: Colors.black87,
            ),
          ],
        ),
        bottomNavigationBar: bookmarkBloc.itemsCartLength == 0
            ? null
            : Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Buy all",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        buildGroupCheckbox(bookmarkBloc.itemsCart),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87)),
                        Text(
                            calculateTotalPrice(itemsList(bookmarkBloc.itemsCart)).toStringAsFixed(3),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: calculateTotalPrice(itemsList(bookmarkBloc.itemsCart)) == 0.0 
                      ? null
                      : () {
                        buildShowConfirmDialog(context, itemsList(bookmarkBloc.itemsCart));
                      },
                      child: Text("Buy"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurple[400])),
                    )
                  ],
                ),
              ),
        body: bookmarkBloc.itemsCartLength == 0
            ? Center(
                child: Text(
                "Empty",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ))
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                    itemCount: bookmarkBloc.itemsCartLength,
                    itemBuilder: (context, index) {
                      var carId = bookmarkBloc.itemsCart[index];
                      final item = cars.firstWhere((car) => car.id == carId);
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          color: Colors.white60,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Ink.image(
                                    image: AssetImage(getImage(item.image).name),
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
                                        priceEachCar(item.price, item.numberCar).toStringAsFixed(3),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (item.numberCar > 1) {
                                                  item.numberCar--;
                                                }
                                              });
                                            },
                                            child: Icon(
                                                Icons.remove_circle_outline,
                                                color: Colors.black87),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            item.numberCar.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          ),
                                          SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                item.numberCar++;
                                              });
                                            },
                                            child: Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.black87),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    buildSingleCheckbox(itemsList(bookmarkBloc.itemsCart), item),
                                    IconButton(
                                        onPressed: () {
                                          bookmarkBloc.deleteItemsCart(item.id);
                                          setState(() {
                                            // Reset attribute 'cart', 'checkBoxCart', 'numberCar'
                                            item.isCart = false;
                                            item.checkBoxCart = false;
                                            item.numberCar = 1;
                                          });
                                        },
                                        icon: Icon(Icons.cancel_outlined)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ));
  }

  Future<dynamic> buildShowConfirmDialog(
      BuildContext context, List<CarsModel> itemsCart) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("CONFIRM.."),
        content: buildContainerContentConfirmDialog(itemsCart),
        backgroundColor: Colors.grey[50],
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Yes")),
        ],
      ),
    );
  }

  Container buildContainerContentConfirmDialog(
      List<CarsModel> itemsCart) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: itemsCart.length > 0
                ? itemsCart.map((item) => item.checkBoxCart
                          ? Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 62, 
                                  child: Text(
                                    item.name, style: 
                                    TextStyle(
                                      fontWeight: FontWeight.w600, 
                                      color: Colors.black87),)),
                                Expanded(
                                  flex: 13, 
                                  child: Text(
                                    "x" + item.numberCar.toString(), 
                                    style: TextStyle(
                                      color: Colors.blue[700]),)),
                                Expanded(
                                  flex: 25, 
                                  child: Text(
                                    priceEachCar(item.price, item.numberCar).toStringAsFixed(3), 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600, 
                                      color: Colors.red)),
                                )
                              ],
                            )
                          : Container(),
                    ).toList()
                : [Container()],
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Text(
                  "TOTAL:", 
                  style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    color: Colors.black87),),
                SizedBox(width: 5,),
                Text(
                  calculateTotalPrice(itemsCart).toStringAsFixed(3),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, 
                    color: Colors.red))
              ],
            ))
        ],
      ),
    );
  }

  double calculateTotalPrice(List<CarsModel> itemsCart) {
    double total = 0;
    itemsCart.forEach((item) {
      if (item.checkBoxCart) {
        total = total + priceEachCar(item.price, item.numberCar);
      }
    });
    return total;
  }

  Checkbox buildGroupCheckbox(itemsCart) {
    return Checkbox(
        value: allCheckBoxCart,
        onChanged: (value) {
          setState(() {
            allCheckBoxCart = value!;
            // Set attribute 'checkBoxCart'
            itemsCart.forEach((id) {
              final item = cars.firstWhere((car) => car.id == id);
              item.checkBoxCart = value;
            });
          });
        });
  }

  Checkbox buildSingleCheckbox(itemsCart, item) {
    return Checkbox(
        value: item.checkBoxCart,
        onChanged: (value) {
          setState(() {
            // Set attribute 'checkBoxCart'
            item.checkBoxCart = value!;
            // Set value for checkbox all
            allCheckBoxCart =
                itemsCart.every((item) => item.checkBoxCart == true);
          });
        });
  }

  List<CarsModel> itemsList(List<String> idList) {
    List<CarsModel> itemsList = [];
    idList.forEach((id) {
      final item = cars.firstWhere((car) => car.id == id);
      itemsList.add(item);
    });
    return itemsList;
  }
}

  double priceEachCar(List<Prices> pricesList, int numberCar) {
    double price = 0;
    pricesList.forEach((item) {
      if (item.isChoice) {
        price = item.price * numberCar;
      }
    });
    return price;
}

  Images getImage(List<Images> imagesList) {
    Images image = new Images(name: '', color: '', isChoice: false);
    imagesList.forEach((item) { 
      if (item.isChoice) {
        image = item;
      }
    });
    return image;
}
