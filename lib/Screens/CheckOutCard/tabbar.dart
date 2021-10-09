import 'package:flutter/material.dart';
import 'package:gold_crowne/Screens/CheckOutCard/creditcard.dart';
import 'package:gold_crowne/Screens/CheckOutCard/paybycash.dart';
import 'package:gold_crowne/constants.dart';

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: cardBackgroundColor,
          appBar: TabBar(
            indicatorWeight: 2,
            unselectedLabelColor: cardBackgroundColor,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            indicator: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/visa.png",
                      height: 40,
                      width: 40,
                    ),
                    Image.asset(
                      "assets/mastercard.png",
                      height: 40,
                      width: 40,
                   
                    )
                  ],
                ),
              ),
              Tab(child: Center(child: Image.asset("assets/cash.png",width: 60,height: 60,),),),
            ],
          ),
          body: TabBarView(
            children: [CreditCardFields(), PayByCash()],
          )),
    );
  }
}
