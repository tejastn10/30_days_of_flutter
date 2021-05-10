import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item item;
  AddToCart({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Store).cart;
    bool isInCart = _cart.items.contains(item);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          final _catalog = CatalogModel();
          isInCart = isInCart.toggle();
          _cart.add(item);
          _cart.catalog = _catalog;
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
