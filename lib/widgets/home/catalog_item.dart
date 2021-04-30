import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: ItemImage(
              image: item.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.name.text.lg.color(context.theme.accentColor).bold.make(),
                item.desc.text
                    .color(context.theme.accentColor)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${item.price}"
                        .text
                        .color(context.theme.accentColor)
                        .semiBold
                        .lg
                        .make(),
                    AddToCart(item: item),
                  ],
                ).pOnly(right: 16),
              ],
            ),
          )
        ],
      ),
    ).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}

class ItemImage extends StatelessWidget {
  final String image;

  const ItemImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.theme.canvasColor).make().p16().w40(context);
  }
}
