import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: primaryColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Image.asset(
                "assets/drawer.png",
                width: 20,
                height: 20,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: MediaQuery.of(context).size.height * 0.1),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/onboard1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "Zotobyte",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "Zotobyte@gmail.com",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed("/mainscreen");
              },
              child: Padding(
                padding: drawerPadding,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/home.png",
                      width: 22,
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: drawerPadding,
              child: Row(
                children: [
                  Image.asset(
                    "assets/mycart.png",
                    width: 22,
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Cart",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/ordershistory");
              },
              child: Padding(
                padding: drawerPadding,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/package.png",
                      width: 22,
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "My Orders",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: drawerPadding,
              child: Row(
                children: [
                  Icon(Icons.person),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Account",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: drawerPadding,
              child: Row(
                children: [
                  Icon(Icons.help),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Help",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: drawerPadding,
              child: Row(
                children: [
                  Image.asset(
                    "assets/logout.png",
                    width: 22,
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
