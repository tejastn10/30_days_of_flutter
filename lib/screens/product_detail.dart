import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
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
      appBar: AppBar(),
      backgroundColor: AppTheme.cream,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${product.price}".text.semiBold.xl.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppTheme.darkBlue,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              child: "Buy".text.lg.bold.make(),
            ).wh(100, 50),
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
            ).h48(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      product.name.text.xl3
                          .color(AppTheme.darkBlue)
                          .bold
                          .make(),
                      product.desc.text.lg
                          .textStyle(context.captionStyle)
                          .bold
                          .make(),
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
