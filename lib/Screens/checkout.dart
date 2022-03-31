import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/CheckOutCard/tabbar.dart';
import 'package:gold_crowne/Screens/Widgets/cardwidget.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/cart_controller.dart';
import 'package:gold_crowne/controller/order_controller.dart';

import 'Widgets/bottom_bar.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  ScrollController _scrollController = ScrollController();
  CartController _cartController = Get.find();
  OrderController _orderController = Get.put(OrderController());

  int val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: primayBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageTopHeading('Checkout'),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: paymentCardBackgroundColor, borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Scrollbar(
                            controller: _scrollController,
                            isAlwaysShown: true,
                            thickness: 2,
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: _cartController.itemList.length,
                                  controller: _scrollController,
                                  itemBuilder: (context, index) {
                                    return CardWidget(
                                      val: index,
                                      onPressed: (value) {},
                                    );
                                  }),
                            ),
                          ),
                        )),
                  ),
                ),
                Spacer(),
                // TabBarWidget(),
                Column(
                  children: [
                    Container(
                      height: kToolbarHeight,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: cardBackgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: RadioListTile(
                            value: 0,
                            groupValue: 0,
                            onChanged: (val) {},
                            activeColor: primaryColor,
                            selectedTileColor: Colors.white,
                            title: Text('COD'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: kToolbarHeight,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: cardBackgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: RadioListTile(
                            value: 1,
                            groupValue: 0,
                            onChanged: (val) {},
                            activeColor: primaryColor,
                            selectedTileColor: Colors.white,
                            title: Text('COD'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                BottomBar(
                  buttonLabel: 'PROCEED TO CONFIRM',
                  price: Obx(
                    () => Text(
                      "\$${_cartController.total.value}",
                      style: priceStyle,
                    ),
                  ),
                  onButtonPressed: () {
                    _orderController.createOrder();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
