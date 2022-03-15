import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        appBar: appbar(context),
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_pic.png"), fit: BoxFit.fill)),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage("assets/more.png"), fit: BoxFit.cover)),
                      ),
                      Positioned(
                          bottom: 45,
                          left: 15,
                          child: Text(
                            "Melenia",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                      Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            "05.10.21",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                      Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed("/shop");
                              },
                              child: Text(
                                "Select",
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 20),
                  child: Row(
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
