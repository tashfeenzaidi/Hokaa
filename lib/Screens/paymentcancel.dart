import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constant/constants.dart';

class PaymentCancel extends StatelessWidget {
  const PaymentCancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/payment-denied.png",
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Your Payment\nHas Been Rejected",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "We are sorry for the inconvenience\nPlease Try again",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/checkout");
            },
            child: Text(
              "Back to Checkout",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
