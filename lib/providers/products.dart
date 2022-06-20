import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavourate;

  Product({
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.title,
    this.isFavourate = false,
  });

  void toggleFavorite() {
    isFavourate = !isFavourate;
    notifyListeners();
  }
}
