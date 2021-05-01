import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item item;
  const AddToCart({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
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
          : Icon(
              CupertinoIcons.cart_badge_plus,
            ),
    );
  }
}
