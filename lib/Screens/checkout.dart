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
        leading: Icon(Icons.arrow_back_ios),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primayBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text("Check Out",
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
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
                    height: MediaQuery.of(context).size.height * 0.4,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "An exclusive flovour with lemon and peach flovour",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
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
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: paymentCardBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: TabBarWidget()),
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
                            Get.toNamed("/paymentdone");
                          },
                          child: Text(
                            "Proceed To CheckOut",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
