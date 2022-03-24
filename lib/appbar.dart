import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
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
      IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black,
            size: 29,
          )),
      IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.toNamed("/cart");
          },
          icon: Image.asset(
            "assets/shopping_cart.png",
            width: 25,
            height: 25,
          )),
    ],
  );
}
