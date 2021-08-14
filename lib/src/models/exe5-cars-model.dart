class CarsModel {
  String id;
  String name;
  List<Prices> price;
  List<Images> image;
  double height;
  double length;
  double width;
  double weight;
  bool isFavourite;
  bool isCart;
  bool checkBoxCart;
  int numberCar;

  CarsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.height,
    required this.length,
    required this.width,
    required this.weight,
    required this.isFavourite,
    required this.isCart,
    required this.checkBoxCart,
    required this.numberCar,
  });
}

class Prices {
  String period;
  double price;
  bool isChoice;

  Prices({
    required this.period,
    required this.price,
    required this.isChoice,
  });
}

class Images {
  String name;
  String color;
  bool isChoice;

  Images({
    required this.name,
    required this.color,
    required this.isChoice,
  });
}
