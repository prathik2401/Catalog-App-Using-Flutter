// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro_project/core/store.dart';
import 'package:flutter_intro_project/models/cart.dart';
import 'package:flutter_intro_project/utils/routes.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_header.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_intro_project/products/product_catalog.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/v3/b/650f22c10574da7622af4c3a";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var result = decodedData['record'];
    var productsData = result['product'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
          builder: (context, store, _) => FloatingActionButton(
                  onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
                  child: const Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  ))
              .badge(
                  color: Vx.red400,
                  size: 21,
                  count: _cart.items.length,
                  textStyle: const TextStyle(color: Colors.black)),
          mutations: const {AddMutation, RemoveMutation},
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CatalogHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      const CatalogList().py16().expand()
                    else
                      const CircularProgressIndicator().centered().expand()
                  ])),
        ));
  }
}
