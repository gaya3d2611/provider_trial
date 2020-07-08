import 'package:flutter/foundation.dart';

class product with ChangeNotifier {
  final id;
  final title;
  final description;
  final price;
  final imageURL;
  bool isFavourite;
  product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageURL,
    this.isFavourite = false,
  });

  void ToggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
