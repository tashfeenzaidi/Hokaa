import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constants.dart';
import 'package:gold_crowne/drawer.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  int selected = -1;
  int tab = 1;
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
                image: AssetImage("assets/backgorund_pic.png"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: tab == 1 ? Colors.black : primaryColor,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        tab = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Image.asset("assets/small.png"),
                        ),
                        Text(
                          "Single",
                          style: TextStyle(
                              color: tab == 1 ? Colors.white : Colors.black,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: tab == 2 ? Colors.black : primaryColor,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        tab = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Row(
                            children: [
                              Image.asset("assets/small.png",
                                  color:
                                      tab == 2 ? primaryColor : Colors.black),
                              Image.asset("assets/small.png",
                                  color:
                                      tab == 2 ? primaryColor : Colors.black),
                            ],
                          ),
                        ),
                        Text(
                          "Mix",
                          style: TextStyle(
                            fontSize: 18,
                            color: tab == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: tab == 3 ? Colors.black : primaryColor,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        tab = 3;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                          child: Image.asset("assets/up.png",
                              color: tab == 3 ? primaryColor : Colors.black),
                        ),
                        Text(
                          "Sort by",
                          style: TextStyle(
                              fontSize: 18,
                              color: tab == 3 ? primaryColor : Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                            Get.toNamed("/productdetail");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF242424),
                                      border: Border.all(
                                          color: selected == index
                                              ? primaryColor
                                              : Color(0xFF242424)),
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                Positioned(
                                  top: 20,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/hookah.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 40,
                                    child: Text(
                                      "Love",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                                Positioned(
                                    bottom: 10,
                                    left: 25,
                                    child: Text(
                                      "\$ 23",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                                Positioned(
                                  bottom: 10,
                                  right: 20,
                                  child: Image.asset(
                                    "assets/shopping_cart.png",
                                    width: 25,
                                    height: 25,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
