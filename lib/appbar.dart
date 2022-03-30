import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/product_controller.dart';

ProductController _productController = Get.find();

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  final Size preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
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
        Obx(() => Container(
              margin: EdgeInsets.symmetric(vertical: kToolbarHeight * 0.1),
              child: AnimatedContainer(
                width: _productController.isSearchClicked.value
                    ? MediaQuery.of(context).size.width * 0.6
                    : 0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                ),
                duration: Duration(milliseconds: 900),
                child: TextFormField(
                  cursorColor: Colors.black,
                  onChanged: (val) {
                    _productController.productSearch(val);
                  },
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Hint here"),
                ),
              ),
            )),
        IconButton(
          onPressed: () {
            _productController.isSearchClicked.value =
                _productController.isSearchClicked.value ? false : true;
          },
          icon: Obx(
            () => Icon(
              _productController.isSearchClicked.value
                  ? Icons.cancel_outlined
                  : Icons.search_outlined,
              size: 29,
              color: Colors.black,
            ),
          ),
        ),
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
}
