import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/CheckOutCard/tabbar.dart';
import 'package:gold_crowne/constants.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, left: 20, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text("CHECKOUT",
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
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
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              ListView.builder(itemBuilder: (context, index) {
                            return Card(
                              color: cardBackgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 80,
                                      child: Stack(
                                        children: [
                                          Center(
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
                                          )
                                          // Icon(Icons.cancel_outlined,fonts, color: primaryColor)
                                        ],
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
                                      offset: Offset(-20, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.remove_circle,
                                              color: primaryColor),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "1",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                          ),
                                          Image.asset("assets/plus.png")
                                        ],
                                      ),
                                    )
                                  ]),
                            );
                          }),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: paymentCardBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: TabBarWidget()),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage("assets/back.png"),
                            fit: BoxFit.fill)),
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
                                Get.toNamed("/paymentdone");
                              },
                              child: Text("PROCEED TO CONFIRM",
                                  style: checkoutButtonText))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
