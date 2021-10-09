import 'package:flutter/material.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: Image.asset(
          "assets/drawer.png",
          width: 20,
          height: 20,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    elevation: 0,
    actions: [Icon(Icons.search), Icon(Icons.add_shopping_cart)],
  );
}
