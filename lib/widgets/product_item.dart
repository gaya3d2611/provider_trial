import '../screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItem extends StatelessWidget {
  // final id;
  // final title;
  // final imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routeName,
                arguments: singleProduct.id);
          },
          child: Image.network(
            singleProduct.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            singleProduct.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<product>(
              builder: (context, product, child) => IconButton(
                  icon: Icon(singleProduct.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    singleProduct.ToggleFavouriteStatus();
                  })),
          backgroundColor: Colors.black87,
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                  singleProduct.id, singleProduct.price, singleProduct.title);
            },
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
