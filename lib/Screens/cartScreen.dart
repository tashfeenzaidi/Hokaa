import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, top: 15, bottom: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: paymentCardBackgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Scrollbar(
                      controller: _scrollController,
                      thickness: 2,
                      isAlwaysShown: true,
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Card(
                              color: cardBackgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 80,
                                      alignment: Alignment.center,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                "assets/hookah.png",
                                                height: 70,
                                                width: 60,
                                                fit: BoxFit.fill,
                                              ),
                                            ),

                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Image.asset(
                                                "assets/cancel.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 5,
                                              left: 30,
                                              child: Text(
                                                "Watermelon",
                                                style: smallStyle,
                                              ),
                                            ),

                                            // Icon(Icons.cancel_outlined,fonts, color: primaryColor)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "An exclusive flovour with lemon and peach flovour",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          Transform.translate(
                                            offset: Offset(0, 10),
                                            child: Text("\$ 23",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3),
                                          )
                                        ],
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(-13, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (val > 0)
                                                setState(() {
                                                  val--;
                                                });
                                            },
                                            child: Icon(Icons.remove_circle,
                                                color: primaryColor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              val.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  val++;
                                                });
                                              },
                                              child: Image.asset(
                                                  "assets/plus.png"))
                                        ],
                                      ),
                                    )
                                  ]),
                            );
                          }),
                    ),
                  )),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15, top: 30, bottom: 30),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total: \$23",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "Tax: \$23",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage("assets/back.png"), fit: BoxFit.fill)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 23",
                      style: priceStyle,
                    ),
                    MaterialButton(
                      height: 43,
                      minWidth: 153,
                      color: Colors.black,
                      onPressed: () {
                        Get.toNamed("/checkout");
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: primaryColor,
                          ),
                          Text("Checkout", style: checkoutButtonText)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
          //   Container(
          //     margin: EdgeInsets.only(left: 10, right: 10),
          //     width: MediaQuery.of(context).size.width,
          //     // height: MediaQuery.of(context).size.height * 0.6,
          //     decoration: BoxDecoration(
          //         color: paymentCardBackgroundColor,
          //         borderRadius: BorderRadius.circular(20)),
          //     child:
          // SizedBox(
          //       height:MediaQuery.of(context).size.height * 0.6 ,
          //       child: ListView.builder(itemBuilder: (context, index) {
          //         return Container();
          //       }
          //
          //       ),
          //     ),
          //  )
        ],
      ),
    );
  }
}
