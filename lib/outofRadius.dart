import 'package:flutter/material.dart';
import 'package:gold_crowne/constant/constants.dart';

class OutOfRadiusScreen extends StatelessWidget {
  const OutOfRadiusScreen({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  color: paymentCardBackgroundColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel_sharp,
                      color: primaryColor,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/OutOfRadius.png",
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Center(
                      child: Text(
                    "OUT OF RADIUS",
                    style: noEventTextStyle,
                  )),
                  Center(
                      child: Text(
                    "Cannot Proceed",
                    style: Theme.of(context).textTheme.headline2,
                  )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "We Apologize for the  Inconvenience",
                            style: creditCardHintTextstyle,
                          ),
                          Text(
                            "But You Seems Out of Reach",
                            style: creditCardHintTextstyle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/shopping_cart.png",
                            width: 22,
                            height: 22,
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
        ],
      ),
    );
  }
}
