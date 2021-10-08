import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CartScreen extends StatelessWidget {
 

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
          Icon(Icons.search, color: primaryColor),
          Icon(Icons.add_shopping_cart, color: primaryColor)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                color: paymentCardBackgroundColor,
                borderRadius: BorderRadius.circular(20)),
            // child: SizedBox(
            //   height:MediaQuery.of(context).size.height * 0.6 ,
            //   child: ListView.builder(itemBuilder: (context, index) {
            //     return Container();
            //   }
              
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
