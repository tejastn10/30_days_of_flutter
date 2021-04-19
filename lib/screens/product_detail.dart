import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ProductDetails extends StatelessWidget {
  final Item product;
  const ProductDetails({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(product.image),
        ],
      ),
    );
  }
}
