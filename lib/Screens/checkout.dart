import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/CheckOutCard/tabbar.dart';
import 'package:gold_crowne/Screens/Widgets/cardwidget.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/constants.dart';

import 'Widgets/bottom_bar.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  ScrollController _scrollController = ScrollController();
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
                            child: ListView.builder(
                                itemCount: 10,
                                controller: _scrollController,
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
                          ),
                        )),
                  ),
                ),
                Spacer(),
                TabBarWidget(),
                Spacer(),
                BottomBar(
                  buttonLabel: 'PROCEED TO CONFIRM',
                  price: '23',
                  onButtonPressed: () {
                    Get.toNamed("/paymentDone");
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
