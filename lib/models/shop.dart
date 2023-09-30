import 'package:flutter/material.dart';
import 'package:sushi_app/models/sushiModels.dart';

class Shop extends ChangeNotifier {
  List<SushiModels> shopMenu = [
    // 1
    SushiModels("Салмон Суши", "10.00", "assets/images/1.png", "4.5"),
    SushiModels("Туна Суши", "21.00", "assets/images/2.png", "7.0"),
    SushiModels("Суши с угрем", "15.00", "assets/images/3.png", "8.3"),
  ];

  List<SushiModels> _cart = [];
  List<SushiModels> get _shopMenu => shopMenu;
  List<SushiModels> get cart => _cart;

  // add to cart
  void addToCart(SushiModels foodItem, int guantity) {
    for (int i = 0; i < guantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove to cart
  void removeFromCart(SushiModels sushi) {
    _cart.remove(sushi);
    notifyListeners();
  }
}
