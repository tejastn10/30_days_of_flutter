import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Item product;
  const ProductDetails({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${product.price}"
                .text
                .color(context.theme.accentColor)
                .semiBold
                .xl
                .make(),
            AddToCart(
              item: product,
            ).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(product.id.toString()),
              child: Image.network(
                product.image,
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.theme.cardColor,
                  child: Column(
                    children: [
                      product.name.text.xl3.color(AppTheme.lightcl).bold.make(),
                      product.desc.text.lg
                          .textStyle(context.captionStyle)
                          .bold
                          .make(),
                      "Voluptua dolore stet et ipsum sit stet sit, diam aliquyam diam eos erat, at est justo sit rebum at et at, nonumy diam dolor eos kasd diam sed nonumy est diam. Nonumy sit consetetur justo dolores diam nonumy ipsum. Ipsum at et dolor sed dolore aliquyam et duo. Tempor lorem."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
