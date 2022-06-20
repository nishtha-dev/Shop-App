import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/products_details_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({
  //   Key? key,
  //   required this.id,
  //   required this.imageUrl,
  //   required this.title,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetails.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: (() {
            product.toggleFavorite();
          }),
          icon: Icon(
              product.isFavourate ? Icons.favorite : Icons.favorite_border),
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
            color: Theme.of(context).accentColor,
            onPressed: (() {}),
            icon: const Icon(Icons.shopping_cart)),
      ),
    );
  }
}
