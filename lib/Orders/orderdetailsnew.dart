import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gold_crowne/Screens/Widgets/back_button.dart';
import 'package:gold_crowne/Screens/Widgets/custom_appbar.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/models/order_response_model.dart';
import 'package:gold_crowne/utils.dart';

class OrderDetailsNew extends StatelessWidget {
  OrderDetailsNew({Key? key}) : super(key: key);
  var data = Get.arguments as Data;

  getItems() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
            child: SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primayBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(children: [
                Container(margin: EdgeInsets.only(top: 15), child: PageTopHeading('ORDER DETAILS')),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5, bottom: 30),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Utils.getDate(DateTime.parse(data.createdAt!)),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Order ID",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  '#${data.id}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: data.items!.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15,
                      ),
                      child: Card(
                        color: cardBackgroundColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Center(
                              child: Image.network(
                                e.image!,
                                height: 60,
                                width: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(e.name!, style: nameStyle),
                                Transform.translate(
                                  offset: Offset(0, 10),
                                  child: Text("\$${e.itemPrice}", style: pricenameStyle),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("QTY", style: nameStyle),
                              Transform.translate(
                                offset: Offset(0, 10),
                                child: Text('${e.quantity}', style: pricenameStyle),
                              )
                            ],
                          ),
                        ]),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30, bottom: 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: cardBackgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Image.asset("assets/visa1.png")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: cardBackgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Status",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Image.asset("assets/done1.png")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 10,
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage("assets/back.png"), fit: BoxFit.fill)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: smallblack,
                              ),
                              Text(
                                "\$${data.subTotal}",
                                style: smallblack,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: smallblack,
                              ),
                              Text(
                                "\$${data.tax}",
                                style: smallblack,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: priceTextStyle,
                              ),
                              Text(
                                "\$${data.totalPrice}",
                                style: priceTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ))));
  }
}
