import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertrial/provider/product_provider.dart';

class ProductDetails extends StatelessWidget {
  // final title;
  // ProductDetails(this.title);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
