import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constant/constants.dart';

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
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/done.png",
                height: 250,
                width: 250,
                fit: BoxFit.fill,
              )),
          Text(
            "Your Order\nHas Been Accepted",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Your order has been placed and is on\nits way to be processed",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/shop");
            },
            child: Text(
              "Back to Home",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
