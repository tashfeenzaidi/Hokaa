import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 60,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text("ORDER HISTORY",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Container(
                            width: 60,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/orderDetailsNew");
                                  },
                                  child: Container(
                                      height: 100,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: cardBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "15th Oct,12:24",
                                                  style: littleDateStyle,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: primaryColor,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Order ID",
                                                  style: historyTextstyle,
                                                ),
                                                Text(
                                                  "#1234555555",
                                                  style: historyTextstyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Status",
                                                  style: historyTextstyle,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.cancel,
                                                      color: Colors.red,
                                                      size: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Text(
                                                        "Rejetced",
                                                        style: historyTextstyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: historyTextstyle,
                                                ),
                                                Text(
                                                  "\$80",
                                                  style: historyTextstyle,
                                                ),
                                              ],
                                            ),
                                          ]))

                                  //  Padding(
                                  //   padding:
                                  //       EdgeInsets.only(left: 20.0, right: 20),
                                  //   child: Column(
                                  //     children: [
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Padding(
                                  //             padding: const EdgeInsets.all(8.0),
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(2.0),
                                  //                   child: Text(
                                  //                     "WATERMELON",
                                  //                     style: historyTextstyle,
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(2.0),
                                  //                   child: Text(
                                  //                     "#1234555555",
                                  //                     style: historyTextstyle,
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(2.0),
                                  //                   child: Row(
                                  //                     children: [
                                  //                       Icon(
                                  //                         Icons.calendar_today,
                                  //                         color: primaryColor,
                                  //                         size: 10,
                                  //                       ),
                                  //                       Text(
                                  //                         "15th Oct,12:24",
                                  //                         style: littleDateStyle,
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(2.0),
                                  //                   child: Row(
                                  //                     children: [
                                  //                       Text(
                                  //                         "Status:",
                                  //                         style: historyTextstyle,
                                  //                       ),
                                  //                       Icon(
                                  //                         Icons.cancel_rounded,
                                  //                         color: Colors.red,
                                  //                         size: 15,
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           Icon(
                                  //             Icons.arrow_forward_ios,
                                  //             color: primaryColor,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Container(
                                  //           width:
                                  //               MediaQuery.of(context).size.width,
                                  //           child: Divider(
                                  //             color: Colors.white,
                                  //             thickness: 1,
                                  //           )),
                                  //     ],
                                  //   ),
                                  // )
                                  ),
                            );
                          }))
                ],
              ),
            ),
          ),
        ));
  }
}
