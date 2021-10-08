import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constants.dart';
import 'package:gold_crowne/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        appBar: appbar(context),
        body: Container(
          color: primayBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage("assets/more.png"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      bottom: 50,
                      left: 10,
                      child: Text(
                        "Melenia",
                        style: Theme.of(context).textTheme.headline1,
                      )),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        "05.10.21",
                        style: Theme.of(context).textTheme.headline4,
                      )),
                  Positioned(
                      right: 10,
                      bottom: 10,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/shop");
                        },
                        child: Text(
                          "Select",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
                      ),
                      Text(
                        "Back",
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Naxt",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
