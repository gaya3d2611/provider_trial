import 'package:flutter/material.dart';
import 'package:providertrial/widgets/app_drawer.dart';
import 'package:providertrial/widgets/productsGrid.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';
import 'cart_screen.dart';
import 'orders_screen.dart';

enum FilterOptions { favorites, all }

class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  @override
  var _showOnlyFavourites = false;
  Widget build(BuildContext context) {
    // final filteredProducts =
    //     Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  //filteredProducts.ShowFavouritesOnly();
                  _showOnlyFavourites = true;
                } else {
                  // filteredProducts.ShowAll();
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              )
            ],
          ),
          Consumer<Cart>(
              builder: (_, cart, child) => Badge(
                    child: child,
                    value: cart.ItemCount.toString(),
                    color: Colors.red,
                  ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ))
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavourites),
    );
  }
}
