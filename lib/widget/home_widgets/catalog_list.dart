import 'package:flutter/material.dart';
import 'package:flutter_intro_project/pages/home_detail_page.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_item.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
