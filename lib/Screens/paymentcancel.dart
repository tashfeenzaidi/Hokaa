import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

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
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                )),
          ),
          Text(
            "Your Payment",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Has Been Rejected",
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "We are sorry for the inconvenience",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Text(
            "Please Try again",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed("/checkout");
              },
              child: Text(
                "Back to CheckOut",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        ],
      ),
    );
  }
}
