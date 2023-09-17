import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_intro_project/products/product_catalog.dart';
import 'package:flutter_intro_project/widget/drawer.dart';
import 'package:flutter_intro_project/widget/item_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade500),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          footer: Container(
                            decoration:
                                const BoxDecoration(color: Colors.black38),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          child: Image.network(item.image)));
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
