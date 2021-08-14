import 'package:flutter/cupertino.dart';

class BookmarkBloc extends ChangeNotifier {
  // Index image on the Car detail
  int indexImageCarDetail = 0;

  // Car - Favourite
  List<String> itemsFavourite = [];
  // Car - Cart
  List<String> itemsCart = [];

  // Car - Favourite
  void additemsFavourite(String id) {
    itemsFavourite.add(id);
    notifyListeners();
  }

  // Car - Favourite
  void deleteitemsFavourite(String id) {
    itemsFavourite.removeWhere((element) => element == id);
    notifyListeners();
  }

  // Car - Cart
  void addItemsCart(String id) {
    itemsCart.add(id);
    notifyListeners();
  }

  // Car - Cart
  void deleteItemsCart(String id) {
    itemsCart.removeWhere((element) => element == id);
    notifyListeners();
  }

  // Car - Favourite
  int get itemsFavouriteLength {
    return itemsFavourite.length;
  }

  // Car - Cart
  int get itemsCartLength {
    return itemsCart.length;
  }
}