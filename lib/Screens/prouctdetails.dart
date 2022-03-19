import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/cart_controller.dart';
import 'package:gold_crowne/controller/product_controller.dart';
import 'package:gold_crowne/models/cart_item.dart';

import 'Widgets/bottom_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentIndex = 0;
  late PageController _controller;
  ProductController _productController = Get.find();
  CartController _cartController = Get.find();
  late int productIndex = Get.arguments;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayBackgroundColor,
      appBar: AppBar(
        backgroundColor: primayBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/search.png",
              width: 25,
              height: 25,
              color: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/shopping_cart.png",
              width: 25,
              height: 25,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _productController.value!.data![productIndex].image!))),
                        ),
                      );
                    })),
            Transform.translate(
              offset: Offset(0, -40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    height: currentIndex == index ? 5 : 5,
                    width: currentIndex == index ? 8 : 5,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentIndex == index ? primaryColor : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.11,
          decoration:
              BoxDecoration(color: cardBackgroundColor, borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _productController.value!.data![productIndex].name!,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: primaryColor,
                      ),
                      Text(
                        "(4.5)",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              Text(
                "${_productController.value!.data![productIndex].description!}",
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.left,
                // maxLines: 2,
              )
            ],
          ),
        ),
        BottomBar(
          buttonLabel: 'ADD tO CART',
          price: '23',
          onButtonPressed: () {
            _cartController.itemList.value
                .add(CartItem(product: _productController.value!.data![productIndex]));
            Get.toNamed("/cart");
          },
        ),
      ]),
    );
  }
}
