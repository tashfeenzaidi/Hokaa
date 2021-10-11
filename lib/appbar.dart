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
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/search.png",
          width: 25,
          height: 25,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/shopping_cart.png",
          width: 25,
          height: 25,
        ),
      ),
    ],
  );
}
