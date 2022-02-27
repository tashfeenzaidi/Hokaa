import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/Widgets/cardwidget.dart';
import 'package:gold_crowne/constants.dart';

import 'Widgets/bottom_bar.dart';
import 'Widgets/label_value.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollController _scrollController = ScrollController();
  int val = 1;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15, bottom: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: paymentCardBackgroundColor, borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return CardWidget(
                            val: val,
                            onPressed: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                          );
                        }),
                  )),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30, bottom: 30),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: cardBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelValue(
                        label: 'Sub Total',
                        value: '23',
                      ),
                      LabelValue(
                        label: 'Tax',
                        value: '0.03',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomBar(
            buttonLabel: 'CHECKOUT',
            price: '23',
            onButtonPressed: () {
              Get.toNamed("/checkout");
            },
          ),
        ],
      ),
    );
  }
}
