import 'package:flutter/cupertino.dart';
import 'package:providertrial/provider/product.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<product> _items = [
    product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    product(
        id: 'p2',
        title: 'OnePlus',
        description: 'An amazing phone.',
        price: 59.99,
        imageURL:
            'https://zdnet2.cbsistatic.com/hub/i/r/2020/04/16/eec13838-b837-46d9-9c01-06be587775f2/resize/1200x900/ba8b23496720fc0abc1bbc1bfa693596/oneplus-8-pro-header.jpg'),
    product(
        id: 'p3',
        title: 'Dress',
        description: 'An amazing gaming experience with this laptop.',
        price: 59.99,
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8zXMm2Qkl5TuDdBb9xhWP1fcMo0WENb2b5GaFl_VZpAA7kU44SGhf1KrhyQJW0oArrQJ2Cws&usqp=CAc'),
    product(
        id: 'p4',
        title: 'Pan',
        description: 'An amazing pan.',
        price: 59.99,
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRnYHXvL0vf6l-dJndjbO0beQjVzPLN7s2tIQ&usqp=CAU')
  ];

  var _showFavoritesOnly = false;

  List<product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prodItem) => prodItem.isFavourite).toList();
    }
    return [..._items];
  }

  List<product> get favItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void ShowFavouritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void ShowAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }
}
