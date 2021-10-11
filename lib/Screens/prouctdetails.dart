import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gold_crowne/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentIndex = 0;
  late PageController _controller;

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
        leading: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
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
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
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
                            image: AssetImage("assets/hookah.png"))),
                  ),
                );
              }),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                height: currentIndex == index ? 8 : 8,
                width: currentIndex == index ? 8 : 8,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: currentIndex == index ? primaryColor : Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
                color: paymentCardBackgroundColor,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Love 66",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: primaryColor,
                        ),
                        Text(
                          "4.5",
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  "An Exclusive flower that is available for limited time",
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 20),
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
                color: paymentCardBackgroundColor,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Size",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "S",
                        style: Theme.of(context).textTheme.button,
                      )),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "M",
                        style: Theme.of(context).textTheme.subtitle2,
                      )),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("L",
                              style: Theme.of(context).textTheme.subtitle2)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ 23",
                    style: Theme.of(context).textTheme.button,
                  ),
                  MaterialButton(
                    height: 40,
                    color: Colors.black,
                    onPressed: () {
                      Get.toNamed("/cart");
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/shopping_cart.png",
                          width: 22,
                          height: 22,
                          color: primaryColor,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
