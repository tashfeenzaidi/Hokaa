import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class PaymentConfirm extends StatelessWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/done.png",
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              )),
          Text(
            "Your Order",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Has Been Accepted",
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Your item has been placed and is on",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Text(
            "its way to be processed",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed("/paymentcancel");
              },
              child: Text(
                "Back to Home",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        ],
      ),
    );
  }
}
