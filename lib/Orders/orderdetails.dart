import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgorund_pic.png"),
                  fit: BoxFit.cover)),
          child: Container(
              child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  "assets/order-detail.png",
                  height: 200,
                  width: 200,
                )),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Container(
                    decoration: BoxDecoration(
                        color: primayBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 40,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text("ORDER DETAILS",
                                  style: Theme.of(context).textTheme.headline3),
                            ),
                            Container(
                                width: 40,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: paymentCardBackgroundColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/hookah.png",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      Text("WterMelon", style: littleTextStyle)
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "An exclusive flovour with the combination on Peach & Two Apples & some love",
                                            style: littleTextStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Price:",
                                                style: littleDateStyle,
                                              ),
                                              Text(
                                                "\$ 23",
                                                style: littleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "#356253762",
                                            style: littleDateStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color: primaryColor,
                                                size: 10,
                                              ),
                                              Text(
                                                "15th Oct,12:24",
                                                style: littleDateStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, right: 20),
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("PAYMENT HISTORY",
                                        style: historyTextstyle),
                                    Text("ORDER ID: #356253762",
                                        style: historyTextstyle),
                                  ],
                                ),
                              ),
                              //parent column in which dotted line and all things are done
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.1),
                                child: Column(
                                  children: [
                                    Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.0),
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.done,
                                                    size: 15,
                                                  ),
                                                )),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                "\$ 23",
                                                style: littleTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              child: DottedLine(
                                                direction: Axis.vertical,
                                                dashColor: primaryColor,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text(
                                                "First payment CreditCard",
                                                style: creditCardHintTextstyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                    Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.0),
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.done,
                                                    size: 15,
                                                  ),
                                                )),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                "\$ 23",
                                                style: littleTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              child: DottedLine(
                                                direction: Axis.vertical,
                                                dashColor: primaryColor,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text(
                                                "First payment CreditCard",
                                                style: creditCardHintTextstyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                    Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.0),
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.done,
                                                    size: 15,
                                                  ),
                                                )),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                "\$ 23",
                                                style: littleTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Text(
                                                "First payment CreditCard",
                                                style: creditCardHintTextstyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ])
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])))
          ])),
        ));
  }
}
