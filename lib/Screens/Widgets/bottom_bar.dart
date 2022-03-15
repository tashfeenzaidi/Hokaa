import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constant/constants.dart';

class BottomBar extends StatelessWidget {
  String price;
  Icon? icon;
  String buttonLabel;
  VoidCallback onButtonPressed;

  BottomBar(
      {required this.buttonLabel, required this.price, this.icon, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          image: DecorationImage(image: AssetImage("assets/back.png"), fit: BoxFit.fill)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
              style: priceStyle,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 13, horizontal: 19)),
                ),
                onPressed: onButtonPressed,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/shopping_cart.png',
                        height: 22,
                        width: 22,
                        color: primaryColor,
                      ),
                      margin: EdgeInsets.only(right: 3),
                    ),
                    Text(
                      buttonLabel,
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
