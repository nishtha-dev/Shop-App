import 'package:flutter/material.dart';

import 'package:shop_app/dummy_product.dart';
import 'package:shop_app/providers/products.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;

  //bool _showFavoriteOnly = false;

  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((prodItem) => prodItem.isFavourate).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourate).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  // void showfavorites() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  void addProducts() {
    notifyListeners();
  }
}
