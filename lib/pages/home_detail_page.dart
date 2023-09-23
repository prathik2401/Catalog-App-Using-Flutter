// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro_project/widget/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';

class HomeDetailsPage extends StatefulWidget {
  final Item catalog;

  const HomeDetailsPage({
    Key? key,
    required this.catalog,
    // ignore: unnecessary_null_comparison
  })  : assert(catalog != null),
        super(key: key);

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: SafeArea(
          bottom: false,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${widget.catalog.price}".text.bold.red600.xl4.make(),
              AddToCart(widget.catalog).wh(120, 45).pOnly(right: 0)
            ],
          ).pOnly(bottom: 40, left: 32, top: 32, right: 20),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(widget.catalog.id.toString()),
                    child: Image.network(widget.catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(children: [
                      widget.catalog.name.text.xl4.bold
                          .color(context.accentColor)
                          .make()
                          .py8(),
                      widget.catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      "Amet clita clita eos et nonumy dolores kasd, elitr stet dolor accusam et. Voluptua voluptua magna sit takimata et eirmod clita. No lorem at eirmod sed accusam kasd lorem labore. Diam nonumy eirmod diam takimata dolores. Ipsum nonumy duo erat labore dolor et et ipsum lorem, sit sanctus erat tempor."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ]).py64(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
