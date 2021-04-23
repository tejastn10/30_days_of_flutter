import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/screens/product_detail.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(product: item),
            ),
          ),
          child: CatalogItem(item: item),
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}
