import 'package:flutter_intro_project/products/product_catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //Catalog Field
  late CatalogModel _catalog;
  //Collection of IDs
  // ignore: non_constant_identifier_names
  final List<int> _ItemIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //GetItems in the cart
  List get items => _ItemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _ItemIds.add(item.id);
  }

  //Removie item
  void remove(Item item) {
    _ItemIds.remove(item.id);
  }
}
