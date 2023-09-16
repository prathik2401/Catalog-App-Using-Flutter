class CatalogModel {
  static final items = [
    Item(
        id: 1,
        color: "White",
        desc: "The ultimate iPhone",
        imageUrl:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-compare-iphone-15-pro-202309?wid=384&hei=512&fmt=jpeg&qlt=90&.v=1692827834790",
        name: "Apple iPhone 15 Pro",
        price: 1199)
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageUrl});
}
