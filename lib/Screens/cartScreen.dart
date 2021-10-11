import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class CartScreen extends StatelessWidget {
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
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Card(
                        color: cardBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/hookah.png",
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "An exclusive flovour with lemon and peach flovour",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text("\$ 23",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3)
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.remove_circle,
                                      color: primaryColor),
                                  Text(
                                    "1",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Icon(Icons.add_box, color: primaryColor)
                                ],
                              )
                            ]),
                      );
                    }),
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
                  borderRadius: BorderRadius.circular(10),
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
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
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
                      color: Colors.black,
                      onPressed: () {
                        Get.toNamed("/checkout");
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
