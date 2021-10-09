import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class PayByCash extends StatelessWidget {
  const PayByCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentCardBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Please Pay by Cash",style: Theme.of(context).textTheme.subtitle1,),
        Text("Once the product is delivered to you",style: Theme.of(context).textTheme.subtitle1,),

      ]),
    );
  }
}
