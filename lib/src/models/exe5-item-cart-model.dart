class ItemCarCartModel {
  String id;
  String name;
  Map price;
  Map image;
  int numberCar;
  bool checkBoxCart;


  ItemCarCartModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.numberCar,
      required this.checkBoxCart});
}
