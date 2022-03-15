import 'package:flutter/material.dart';
import 'package:gold_crowne/constant/constants.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            color: primaryColor,
            child: ListView(padding: EdgeInsets.zero, children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/order-status.png",
                    height: 200,
                    width: 200,
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    decoration: BoxDecoration(
                        color: primayBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                    child: Column(
                      children: [
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
                                child: Text("ORDER STATUS",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/hokaIcon.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Order is accepted / rejected",
                                      style: historyTextstyle,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration:
                                      BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.done,
                                      size: 20,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/perpareIcon.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Order is being prepared",
                                      style: historyTextstyle,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration:
                                      BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.done,
                                      size: 20,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/deliverIcon.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Delivered",
                                      style: historyTextstyle,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration:
                                      BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.done,
                                      size: 20,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ])));
  }
}
