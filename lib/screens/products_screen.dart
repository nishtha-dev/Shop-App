import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product_providers.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';

import '../widgets/products_grid.dart';

enum Filteroptions { favourite, all }

class ProductsOverview extends StatefulWidget {
  ProductsOverview({Key? key}) : super(key: key);

  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var _showfavorites = false;
  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (Filteroptions selectedValue) {
                print(selectedValue);
                setState(() {
                  if (selectedValue == Filteroptions.favourite) {
                    //...
                    //productsData.showfavorites();
                    _showfavorites = true;
                  } else {
                    //..
                    //productsData.showAll();
                    _showfavorites = false;
                  }
                });
              },
              itemBuilder: ((context) => [
                    const PopupMenuItem(
                      child: Text("Show favorites"),
                      value: Filteroptions.favourite,
                    ),
                    const PopupMenuItem(
                      child: Text("Show all"),
                      value: Filteroptions.all,
                    )
                  ])),
          Consumer<Cart>(
            builder: (context, cart, child) =>
                BadgeWidget(child: child!, value: cart.itemCount.toString()),
            child: IconButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
                icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: ProductsGrid(
        filteredOption: _showfavorites,
      ),
    );
  }
}
