import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertrial/provider/product.dart';
import '../provider/product_provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;
  ProductGrid(this.showFavorites);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = showFavorites ? productsData.favItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
          // create: (context) => products[i],
          value: products[i],
          child: ProductItem(
              // products[i].id,
              // products[i].title,
              // products[i].imageURL
              )),
      itemCount: products.length,
    );
  }
}
