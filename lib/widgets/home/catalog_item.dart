import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
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
                    _AddToCart(item: item),
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

class _AddToCart extends StatefulWidget {
  final Item item;
  const _AddToCart({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.item);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          final _catalog = CatalogModel();
          setState(() {
            isInCart = isInCart.toggle();
            _cart.add(widget.item);
            _cart.catalog = _catalog;
          });
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart
          ? Icon(
              Icons.done,
            )
          : Text(
              "Add to cart",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
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
