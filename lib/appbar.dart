import 'package:flutter/material.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    elevation: 0,
    actions: [Icon(Icons.search), Icon(Icons.add_shopping_cart)],
  );
}
