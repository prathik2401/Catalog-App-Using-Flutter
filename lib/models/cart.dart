import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_intro_project/core/store.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //GetItems in the cart
  List get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total price  num get totalPrice =>
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Removie item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item1;

  AddMutation(this.item1);

  @override
  perform() {
    store?.cart._itemIds.add(item1.id);
  }
}
