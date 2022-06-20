import 'package:flutter/material.dart';

import 'package:shop_app/dummy_product.dart';
import 'package:shop_app/providers/products.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProducts() {
    notifyListeners();
  }
}
