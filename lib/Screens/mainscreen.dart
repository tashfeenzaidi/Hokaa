import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/drawer.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

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
                Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: PageView.builder(
                      controller: controller,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 23.0),
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage("assets/more.png"), fit: BoxFit.cover)),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Text(
                                              "Melenia",
                                              style: Theme.of(context).textTheme.headline5,
                                            ),
                                            Text(
                                              "05.10.21",
                                              style: Theme.of(context).textTheme.headline4,
                                            )
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.toNamed("/shop");
                                          },
                                          child: Text(
                                            "Select",
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: primaryColor,
                            onPressed: () {
                              controller.previousPage(
                                  duration: Duration(seconds: 1), curve: Curves.bounceIn);
                            },
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
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            color: primaryColor,
                            onPressed: () {
                              controller.nextPage(
                                  duration: Duration(seconds: 1), curve: Curves.slowMiddle);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
