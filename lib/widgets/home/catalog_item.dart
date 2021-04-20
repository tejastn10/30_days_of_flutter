import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

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
                item.name.text.lg.color(AppTheme.darkBlue).bold.make(),
                item.desc.text
                    .color(AppTheme.darkBlue)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${item.price}".text.semiBold.lg.make(),
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
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 16),
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class ItemImage extends StatelessWidget {
  final String image;

  const ItemImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(AppTheme.cream).make().p16().w40(context);
  }
}
