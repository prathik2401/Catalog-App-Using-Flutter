class Item {
  final String id;
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

final products = [
  Item(
      id: "prathik001",
      color: "White",
      desc: "Latest gen iphone",
      imageUrl: "",
      name: "iPhone 15 Pro",
      price: 1299),
];
