import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/dummy_product.dart';
import 'package:shop_app/providers/product_providers.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool filteredOption;
  const ProductsGrid({Key? key, required this.filteredOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        filteredOption ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: dummyProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(),
              // id: products[i].id,
              // imageUrl: products[i].imageUrl,
              // title: products[i].title),
            ));
  }
}
