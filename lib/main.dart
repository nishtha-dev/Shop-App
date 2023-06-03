import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product_providers.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/products_details_screen.dart';
import 'package:shop_app/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: ((context) => Cart()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            cardColor: Colors.white,
            // canvasColor: ,
            // accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverview(),
        routes: {
          ProductDetails.routeName: (context) => ProductDetails(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
      ),
      body: const Center(
        child: Text('Lets Build it'),
      ),
    );
  }
}
